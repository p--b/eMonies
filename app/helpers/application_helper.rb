module ApplicationHelper
  def to_money(i)
    number_to_currency(i, unit: "£", negative_format: "(%u%n)")
  end
end
