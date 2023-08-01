class Info < ApplicationRecord
  belongs_to :user
  validates :biography, presence: true
  validates :speciality, presence: true
  validates :experience, presence: true
  validates :contact, presence: true

end
