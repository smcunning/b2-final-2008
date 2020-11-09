require 'rails_helper'

describe Hospital, type: :model do
  describe "relationships" do
    it {should have_many :doctors}
  end

  describe 'instance methods' do
    it "#total_doctors" do
      @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @doctor = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: @hospital.id)
      @doctor_2 = Doctor.create!(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: @hospital.id)
      @doctor_3 = Doctor.create!(name: "Miranda Bailey", specialty: "General Surgery", education: "Johns Hopkins University", hospital_id: @hospital.id)
      @doctor_4 = Doctor.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania", hospital_id: @hospital.id)

      expect(@hospital.total_doctors).to eq(4)
    end
  end
end
