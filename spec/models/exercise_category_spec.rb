require 'rails_helper'

RSpec.describe ExerciseCategory, type: :model do
  describe "Relationships" do
    it {should belong_to(:category)}
    it {should belong_to(:exercise)}
  end
end
