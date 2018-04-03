class Workout < ApplicationRecord
  validates :name, :weekday, :status, presence: true
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises

  enum status: [:done, :partial, :missed]
end
