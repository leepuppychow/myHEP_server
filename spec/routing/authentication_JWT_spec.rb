require 'rails_helper'

RSpec.describe Api::V1::UserTokenController, type: :routing do
  describe "Authentication routing with Knock gem" do
    it "routes /api/v1/user_token to user_token#create" do
      expect(:post => "/api/v1/user_token").to route_to "api/v1/user_token#create"
    end
  end
end
