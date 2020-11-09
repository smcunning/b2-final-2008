class PatientDoctorsController < ApplicationController

  def destroy
    @pd = PatientDoctor.where(patient_id: patient_params[:id])
    @pd.first.delete
    redirect_to request.referrer
  end

  private
  def patient_params
    params.permit(:id)
  end
end
