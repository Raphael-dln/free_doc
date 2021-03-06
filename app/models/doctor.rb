class Doctor < ApplicationRecord
  belongs_to :city
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
  has_many :specialty_doctors, dependent: :destroy
  has_many :specialties, through: :specialty_doctors
end
