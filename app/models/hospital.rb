class Hospital < ApplicationRecord
  has_many :doctors

  def total_doctors
    doctors.count
  end

  def find_unique_universities
    doctors.select(:education).distinct.pluck(:education)
  end
end
