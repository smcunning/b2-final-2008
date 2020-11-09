class HospitalsController < ApplicationController
  def show
    @hospital = Hospital.find(hospital_params[:id])
    @unique_universities = @hospital.find_unique_universities
  end

  private
  def hospital_params
    params.permit(:id)
  end
end
