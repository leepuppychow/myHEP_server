class Workout < ApplicationRecord
  validates :name, :status, presence: true
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises
  has_many :weekdays

  enum status: [:done, :partial, :missed]
end
