class PatientsController < ApplicationController

  def index
    patients = Patient.all
    @patient_names_by_age = patients.names_by_age
  end
end
