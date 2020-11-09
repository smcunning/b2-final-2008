require 'rails_helper'

describe 'hospitals show page' do
  describe 'I see the hospitals information' do
    before :each do
      @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @doctor = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: @hospital.id)
      @doctor_2 = Doctor.create!(name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", hospital_id: @hospital.id)
      @doctor_3 = Doctor.create!(name: "Miranda Bailey", specialty: "General Surgery", education: "Johns Hopkins University", hospital_id: @hospital.id)
      @doctor_4 = Doctor.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", education: "University of Pennsylvania", hospital_id: @hospital.id)
    end

    it 'shows the hospitals name' do
      within ".hospital-details" do
        expect(page).to have_content(@hospital.name)
      end
    end

    it 'has the number of doctors that work at this hospital' do
      within ".hospital-details" do
        expect(page).to have_content("Currently Served By 4 Doctors")
      end
    end

    it 'has a unique list of universities that this hospitals doctors attended' do
      within ".doctor-education" do
        expect(page).to have_content("Harvard University", count: 1)
        expect(page).to have_content("Johns Hopkins University", count: 1)
        expect(page).to have_content("University of Pennsylvania", count: 1)
      end
    end
  end
end
