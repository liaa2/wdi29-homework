class User < ApplicationRecord
  # encrypt the 'password' field for this model, and save the encrypted string in the password_digest column. (requires the bcrypt gem)
  has_secure_password # makes password field mandatory

  validates :email, presence: true, uniqueness: true
end
