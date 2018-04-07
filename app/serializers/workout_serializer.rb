class WorkoutSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :status,
             :therapist,
             :created_at,
             :updated_at,
             :weekdays,
             :workout_exercises

  def weekdays
    object.weekdays.pluck(:name)
  end

  def workout_exercises
    object.workout_exercises
      .select("workout_exercises.*, exercises.*, categories.name AS category")
      .joins(:exercise => :categories)
  end


end
