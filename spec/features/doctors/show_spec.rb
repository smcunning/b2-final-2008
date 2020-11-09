require 'rails_helper'

describe 'doctors show page' do
  describe 'I see all of that doctors information' do
    before :each do
      @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @doctor = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", hospital_id: @hospital.id)
      @patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
      @patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
      @patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
      @patient_4 = Patient.create!(name: "Zola Shepherd", age: 2)
      @pd_1 = PatientDoctor.create!(doctor_id: @doctor.id, patient_id: @patient_1.id)
      @pd_2 = PatientDoctor.create!(doctor_id: @doctor.id, patient_id: @patient_2.id)
      @pd_3 = PatientDoctor.create!(doctor_id: @doctor.id, patient_id: @patient_3.id)
      @pd_4 = PatientDoctor.create!(doctor_id: @doctor.id, patient_id: @patient_4.id)

      visit "/doctors/#{@doctor.id}"
    end

    it 'has that doctors details' do
      within ".doctor-details" do
        expect(page).to have_content(@doctor.name)
        expect(page).to have_content(@doctor.specialty)
        expect(page).to have_content(@doctor.education)
      end
    end

    it 'has the name of the hospital where the doctor works' do
      within ".doctor-details" do
        expect(page).to have_content(@doctor.hospital.name)
      end
    end

    it 'has the names of all of the patients the doctor has' do
      within ".all-patients" do
        expect(page).to have_content(@patient_1.name)
        expect(page).to have_content(@patient_2.name)
        expect(page).to have_content(@patient_3.name)
        expect(page).to have_content(@patient_4.name)
      end
    end

    it 'has a button to remove that patient from that doctor' do
      within "#patient-#{@patient_1.id}" do
        expect(page).to have_button("Remove")
      end

      within "#patient-#{@patient_2.id}" do
        expect(page).to have_button("Remove")
      end

      within "#patient-#{@patient_3.id}" do
        expect(page).to have_button("Remove")
      end

      within "#patient-#{@patient_4.id}" do
        expect(page).to have_button("Remove")
      end
    end

    it 'I can click that button to remove patient from show page' do
      within "#patient-#{@patient_1.id}" do
        click_button("Remove")
      end

      expect(current_path).to eq(doctor_path)
      expect(page).not_to have_css("#patient-#{@patient_1.id}")
    end
  end
end
