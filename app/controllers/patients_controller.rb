class PatientsController < ApplicationController

  def index
    patients = Patient.all
    @patient_names_by_age = patients.patient_names_by_age
  end
end
