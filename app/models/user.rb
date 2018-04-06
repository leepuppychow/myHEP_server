class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :email,
        :username, :password_digest, presence: true
  validates :email, :username, :password_digest, uniqueness: true
  has_many :workouts
end
