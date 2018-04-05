class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :username, :password_digest, presence: true
  validates :username, :password_digest, uniqueness: true
  has_many :workouts
end
