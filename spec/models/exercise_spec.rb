require 'rails_helper'

describe Exercise do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_presence_of(:image)}
    it {is_expected.to validate_presence_of(:description)}
  end

  describe "Relationships" do
    it {should have_many(:exercise_categories)}
    it {should have_many(:categories).through(:exercise_categories)}
    it {should have_many(:workout_exercises)}
    it {should have_many(:workouts).through(:workout_exercises)}
  end
end
