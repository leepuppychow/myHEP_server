class CreateWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :workouts do |t|
      t.string :name
      t.string :weekday
      t.string :therapist_first_name
      t.string :therapist_last_name
      t.string :status

      t.timestamps
    end
  end
end
