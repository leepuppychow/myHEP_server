class ChangeWorkoutExerciseStatusToEnum < ActiveRecord::Migration[5.1]
  def change
    change_column :workout_exercises, :status, 'integer USING CAST(status AS integer)', default: 0
  end
end
