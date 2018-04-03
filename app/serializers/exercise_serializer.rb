class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :description, :created_at, :updated_at
  has_many :workouts
  has_many :categories
end
