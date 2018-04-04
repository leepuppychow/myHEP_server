class ChangeWorkoutStatusToEnum < ActiveRecord::Migration[5.1]
  def change
    change_column :workouts, :status, 'integer USING CAST(status AS integer)', default: 0
  end
end
