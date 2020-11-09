class HospitalsController < ApplicationController
  def show
    @hospital = Hospital.find(params[:id])
    @unique_universities = @hospital.find_unique_universities
  end
end
