class AcceptancesController < ApplicationController
  before_action :authenticate_person!

  # POST /acceptances
  # POST /acceptances.json
  def create
    a = acceptance_params
    a[:person_id] = current_person.id
    @acceptance = Acceptance.new(a)

    respond_to do |format|
      if @acceptance.save
        format.html { redirect_to @acceptance.purchase, notice: 'Acceptance was successfully created.' }
        format.json { render json: @acceptance, status: :created, location: @acceptance }
      else
        format.html { redirect_to @acceptance.purchase }
        format.json { render json: @acceptance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /acceptances/1
  # PUT /acceptances/1.json
  def update
    @acceptance = Acceptance.find(params[:id])

    respond_to do |format|
      if @acceptance.person == current_person && @acceptance.update_attributes(acceptance_params)
        format.html { redirect_to @acceptance.purchase, notice: 'Acceptance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to @acceptance.purchase }
        format.json { render json: @acceptance.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def acceptance_params
    params.require(:acceptance).permit(:amount, :note, :purchase_id)
  end
end
