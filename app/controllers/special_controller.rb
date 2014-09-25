class SpecialController < ApplicationController
  before_action :authenticate_person!

  def index
    total = Purchase.all.size
    dealtwith = Purchase.dealtwith.size
    @num_outstanding = total - dealtwith

    respond_to do |format|
      format.html #index.html.erb
    end
  end

  def summary
    respond_to do |format|
      format.html #summary.html.erb
    end
  end
end
