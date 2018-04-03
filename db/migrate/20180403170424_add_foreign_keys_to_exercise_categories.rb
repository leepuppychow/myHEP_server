class AddForeignKeysToExerciseCategories < ActiveRecord::Migration[5.1]
  def change
    add_reference :exercise_categories, :exercise, index: true, foreign_key: true
    add_reference :exercise_categories, :category, index: true, foreign_key: true
  end
end
