require 'rails_helper'

describe "User endpoints" do
  it "Can get information on one user" do
    current_user = create(:user)

    get "/api/v1/users/#{current_user.id}", headers: auth_headers(current_user)

    user = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(user["first_name"]).to be_a String
    expect(user["last_name"]).to be_a String
    expect(user["username"]).to be_a String
    expect(user["email"]).to be_a String
  end

  it "cannot get another user's information" do
    current_user = create(:user, first_name: "Lee")
    another_user = create(:user, first_name: "Jay")

    get "/api/v1/users/#{another_user.id}", headers: auth_headers(current_user)

    expect(response.status).to eq 404
  end

  it "cannot get user info without token" do
    current_user = create(:user)

    get "/api/v1/users/#{current_user.id}"

    expect(response.status).to eq 401 
  end
end
