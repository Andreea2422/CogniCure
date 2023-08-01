class User < ApplicationRecord
  has_many :moods, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :appointments, foreign_key: 'user_id',dependent: :destroy
  has_many :doctor_appointments, class_name: 'Appointment', foreign_key: 'doctor_id',dependent: :destroy
  has_one :info

  before_save{ email.downcase! }
  attr_accessor :remember_token
  validates(:name, presence: true, length: {maximum: 70})
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates(:email, presence: true, length: {maximum: 255},
            format: { with: VALID_EMAIL_REGEX }, uniqueness: true)
  # A pair of virtual attributes (password and password_confirmation),
  #   including presence validations upon object creation
  #   and a validation requiring that they match
  validates(:password, presence: true, length: {minimum: 6}, allow_nil: true)

  has_secure_password

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
             BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
end
