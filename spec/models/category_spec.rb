require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:name)}
  end

  describe "Relationships" do
    it {should have_many(:exercise_categories)}
    it {should have_many(:exercises).through(:exercise_categories)}
  end
end
