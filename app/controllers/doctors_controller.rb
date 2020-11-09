class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(doctor_params[:id])
  end

  private
  def doctor_params
    params.permit(:id)
  end
end
