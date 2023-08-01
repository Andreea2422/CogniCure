class Appointment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :user_doctor, class_name: 'User', foreign_key: 'doctor_id'
  validates :user_id, presence: true
  validates :patient, presence: true
  validates :appointment_date, presence: true
  validates :doctor_id, presence: true
end
