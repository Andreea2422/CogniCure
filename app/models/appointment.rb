class Appointment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :user_doctor, class_name: 'User', foreign_key: 'doctor_id'
end
