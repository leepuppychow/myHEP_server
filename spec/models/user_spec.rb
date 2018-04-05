require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do
    it {is_expected.to validate_presence_of(:first_name)}
    it {is_expected.to validate_presence_of(:last_name)}
    it {is_expected.to validate_presence_of(:username)}
    it {is_expected.to validate_uniqueness_of(:username)}
    it {is_expected.to validate_uniqueness_of(:password_digest)}
  end

  describe "Relationships" do
    it {should have_many(:workouts)}
  end
end
