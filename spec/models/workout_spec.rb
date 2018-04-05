require 'rails_helper'

RSpec.describe Workout, type: :model do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_presence_of(:status)}
  end

  describe "Relationships" do
    it {should have_many(:weekdays)}
    it {should have_many(:workout_exercises)}
    it {should have_many(:exercises).through(:workout_exercises)}
    it {should belong_to(:user)}
  end
end
