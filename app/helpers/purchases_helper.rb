module PurchasesHelper
  # Borrowed from https://stackoverflow.com/questions/9144822/how-to-declare-a-two-dimensional-array-in-ruby.
  # Extended by myself
  class SparseArray
    attr_reader :hash

    def initialize
      @hash = {}
    end

    def [](key)
      hash[key] ||= {}
    end

    def rows
      hash.length
    end

    def merge!(others)
      @hash.merge!(others.hash) do |key, oldval, newval|
        oldval + newval
      end
    end

    def key?(key)
      @hash.key?(key)
    end

    alias_method :length, :rows
  end

  def self.recalculate_owes!
    n_people = Person.all.size

    # Use a nxn array structure, in row -> column order. rows are who paid for an item, columns are the amount owed by the others to that person.
    # The diagonal will (by definition) always be zero. Implemented using a SparseArray, so that memory usage is not large
    d = SparseArray.new

    Purchase.all.each do |p|
      #As this item was paid for by p.person, they are owed the money listed in acceptances by the others (might include themselves).
      p.acceptances.each do |a|
        #If there is an acceptance from p.person to p.person, then consider this a spend of money, and don't update owednesses (you can't owe yourself)
        next if a.person == p.person

        d[p.person.id][a.person.id] = (d[p.person.id][a.person.id].nil? ? 0 : d[p.person.id][a.person.id]) + a.amount
      end
    end

    # Now, we need to simplify the resulting owednesses, so that when A owes B, and B owes A, we just need one transaction to fix this.
    # This will generate a triangular matrix
    Person.all.each do |from|
      if d.key?(from.id) then
        Person.all.each do |to|
          if d[from.id].key?(to.id) then
            #so TO owes FROM something, does FROM owe TO?
            if d.key?(to.id) && d[to.id].key?(from.id) then
              d[from.id][to.id] -= d[to.id][from.id]
              d[to.id][from.id] = 0
            end
          end
        end
      end
    end

    # Store this in the caching table Owednesses
    Owedness.delete_all

    d.hash.each do |to, froms|
      froms.each do |from, amount|
        next if to < from

        o = Owedness.new(from_person: Person.find(from), to_person: Person.find(to), amount: amount)
        o.save!
        oi = Owedness.new(from_person: Person.find(to), to_person: Person.find(from), amount: -amount)
        oi.save!
      end
    end

    true
  end
end
