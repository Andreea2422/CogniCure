class User < ApplicationRecord
  before_save{ email.downcase! }
  validates(:name, presence: true, length: {maximum: 70})
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates(:email, presence: true, length: {maximum: 255},
            format: { with: VALID_EMAIL_REGEX }, uniqueness: true)
  # A pair of virtual attributes (password and password_confirmation),
  #   including presence validations upon object creation
  #   and a validation requiring that they match
  validates(:password, presence: true, length: {minimum: 6})

  has_secure_password

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
             BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
