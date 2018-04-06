require 'rails_helper'

describe "User endpoints" do
  it "Can create a new user" do
    params = {user:
      {
        first_name: "Lee",
        last_name: "Chow",
        username: "leechow",
        password: "password",
        email: "lee@gmail.com"
      }
    }
    post "/api/v1/users", params: params

    user = JSON.parse(response.body)

    expect(response.status).to eq 201
    expect(user["first_name"]).to eq "Lee"
    expect(user["last_name"]).to eq "Chow"
    expect(user["username"]).to eq "leechow"
    expect(user["email"]).to eq "lee@gmail.com"
    expect(user["admin"]).to eq false
    expect(User.count).to eq 1
  end
end
