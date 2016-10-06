class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments


  validates :email,
  presence: true,
  uniqueness: {case_sensitive: false}

  validates :password,
  length: { in: 8..72 },
  on: :create

  has_secure_password

  def self.authenticate(params)
    Patient.find_by_email(params[:email]).try(:authenticate, params[:password])
  end

  # HOOKS
  before_save :downcase_fields

  # PUBLIC METHODS
  def name
    "#{first_name.titlecase} #{family_name.titlecase}"
  end

  def downcase_fields
    self.email = email.downcase
    self.first_name = first_name.downcase
    self.family_name = family_name.downcase
  end

end
