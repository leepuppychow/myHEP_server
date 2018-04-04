require 'rails_helper'

RSpec.describe Weekday, type: :model do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:name)}
  end

  describe "Relationships" do
    it {should belong_to(:workout)}
  end
end
