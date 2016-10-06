class Doctor < ApplicationRecord
  belongs_to :specialty
  has_many :patients, -> { distinct }, through: :appointments
end
