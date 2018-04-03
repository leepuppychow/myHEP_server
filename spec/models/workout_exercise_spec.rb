require 'rails_helper'

RSpec.describe WorkoutExercise, type: :model do
  describe "Validations" do
    it {should validate_presence_of(:sets)}
    it {should validate_presence_of(:reps)}
    it {should validate_presence_of(:status)}
  end

  describe "Relationships" do
    it {should belong_to(:workout)}
    it {should belong_to(:exercise)}
  end
end
