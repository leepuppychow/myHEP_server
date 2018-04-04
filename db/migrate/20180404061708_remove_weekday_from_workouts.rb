class RemoveWeekdayFromWorkouts < ActiveRecord::Migration[5.1]
  def change
    remove_column :workouts, :weekday
  end
end
