require 'rails_helper'

describe Patient, type: :model do
  describe "relationships" do
    it {should have_many :patient_doctors}
    it {should have_many(:doctors).through(:patient_doctors)}
  end

  describe "instance methods" do
    it "#names_by_age" do
      @patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
      @patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
      @patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
      @patient_4 = Patient.create!(name: "Zola Shepherd", age: 2)

      expected = ["Denny Duquette", "Rebecca Pope", "Katie Bryce", "Zola Shepherd"]

      expect(Patient.names_by_age).to eq(expected)
    end

    it "#get_pd" do
      @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
      @doctor = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: @hospital.id)
      @pd = PatientDoctor.create!(doctor_id: @doctor.id, patient_id: @patient_1.id)

      expect(@patient_1.get_pd(@doctor)).to eq(@pd.id)
    end
  end
end
