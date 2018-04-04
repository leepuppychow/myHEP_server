class WorkoutSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :weekday,
             :status,
             :therapist,
             :created_at,
             :updated_at
  has_many :workout_exercises
end
