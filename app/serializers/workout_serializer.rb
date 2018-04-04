class WorkoutSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :status,
             :therapist,
             :created_at,
             :updated_at,
             :weekdays
             
  has_many :workout_exercises

  def weekdays
    object.weekdays.pluck(:name)
  end


end
