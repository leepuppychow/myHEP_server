require 'rails_helper'

describe "User endpoints" do
  it "User can delete their own information" do
    create_list(:user, 2)
    current_user = create(:user)

    expect(User.count).to eq 3

    delete "/api/v1/users/#{current_user.id}",
      headers: auth_headers(current_user)

    user = User.find_by(id: current_user.id)
    expect(response.status).to eq 204
    expect(user).to be nil
    expect(User.count).to eq 2
  end

  it "Cannot delete User without auth token" do
    create_list(:user, 2)
    current_user = create(:user)

    delete "/api/v1/users/#{current_user.id}"

    expect(response.status).to eq 401
  end
end
