class Exercise < ApplicationRecord
  validates :name, :image, :description, presence: true
  has_many :exercise_categories
  has_many :categories, through: :exercise_categories
  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises

end
