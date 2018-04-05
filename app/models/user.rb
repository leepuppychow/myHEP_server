class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :username, :password,
            :api_token, :admin, presence: true
  validates :username, :password_digest, uniqueness: true
  has_many :workouts
end
