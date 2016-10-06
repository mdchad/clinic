class Appointment < ApplicationRecord

  VALID_DATE = /\b\d{2}[\/.]?\d{2}[\/.]?\d{4}\b/

  belongs_to :doctor
  belongs_to :patient

  validates :date, format: { with: VALID_DATE,
      message: "only allow letters" },
  presence: true,
  uniqueness: {case_sensitive: false}

end
