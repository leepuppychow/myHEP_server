class CreateWorkoutExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :workout_exercises do |t|
      t.integer :sets
      t.integer :reps
      t.string :status

      t.timestamps
    end
  end
end
