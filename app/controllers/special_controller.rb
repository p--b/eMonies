class SpecialController < ApplicationController
  before_action :authenticate_person!

  def index
    respond_to do |format|
      format.html #index.html.erb
    end
  end
end
