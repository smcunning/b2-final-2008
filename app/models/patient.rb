class Patient < ApplicationRecord
  has_many :patient_doctors
  has_many :doctors, through: :patient_doctors

  def self.names_by_age
    order("age desc").pluck(:name)
  end
end
