class PatientsController < ApplicationController
  def index
    @patient_names_by_age = Patient.names_by_age
  end
end
