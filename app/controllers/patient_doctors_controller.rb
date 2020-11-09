class PatientDoctorsController < ApplicationController
  def destroy
    @pd = PatientDoctor.find(pd_params[:id]).destroy
    redirect_to request.referrer
  end

  private
  def pd_params
    params.permit(:id)
  end
end
