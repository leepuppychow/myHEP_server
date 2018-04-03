class WorkoutExercise < ApplicationRecord
  validates :sets, :reps, :status, presence: true
  belongs_to :exercise
  belongs_to :workout

  enum status: [:active, :inactive]
end
