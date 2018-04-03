class Exercise < ApplicationRecord
  validates :name,
            :image,
            :description,
            :created_at,
            :updated_at, presence: true
  has_many :exercise_categories
  has_many :categories, through: :exercise_categories
  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises

end
