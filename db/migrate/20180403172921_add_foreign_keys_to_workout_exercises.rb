class AddForeignKeysToWorkoutExercises < ActiveRecord::Migration[5.1]
  def change
    add_reference :workout_exercises, :exercise, index: true, foreign_key: true
    add_reference :workout_exercises, :workout, index: true, foreign_key: true
  end
end
