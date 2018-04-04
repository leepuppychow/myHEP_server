class WorkoutChangeTherapistColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :workouts, :therapist_last_name
    remove_column :workouts, :therapist_first_name
    add_column :workouts, :therapist, :string
  end
end
