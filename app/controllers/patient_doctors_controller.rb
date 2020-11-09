class PatientDoctorsController < ApplicationController

  def destroy
    @pd = PatientDoctor.where(patient_id: params[:id])
    @pd.first.delete
    redirect_to request.referrer
  end
end
