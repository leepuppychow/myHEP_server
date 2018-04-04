class WorkoutExerciseSerializer < ActiveModel::Serializer
  attributes :id, :sets, :reps, :status, :workout_id
  belongs_to :exercise

  def workout_id
    object.workout.id
  end
end
