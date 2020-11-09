require 'rails_helper'

describe 'patient index page' do
  before :each do
    @patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
    @patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
    @patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
    @patient_4 = Patient.create!(name: "Zola Shepherd", age: 2)

    visit "/patients"
  end

  it 'shows a list of all patients listed from oldest to youngest' do
    within ".patient-names" do
      expect(page.all('li')[0]).to have_content(@patient_2.name)
      expect(page.all('li')[1]).to have_content(@patient_3.name)
      expect(page.all('li')[2]).to have_content(@patient_1.name)
      expect(page.all('li')[3]).to have_content(@patient_4.name)
    end
  end
end
