require 'rails_helper'

describe "User endpoints" do
  it "Can update user info" do
    current_user = create(:user)
    params = {user:
      {
        first_name: "Lee",
        last_name: "Chow",
        username: "leechow",
        email: "lee@gmail.com"
      }
    }
    patch "/api/v1/users/#{current_user.id}", params: params,
      headers: auth_headers(current_user)

    user = User.find(current_user.id)

    expect(response.status).to eq 204
    expect(user["first_name"]).to eq "Lee"
    expect(user["last_name"]).to eq "Chow"
    expect(user["username"]).to eq "leechow"
    expect(user["email"]).to eq "lee@gmail.com"
    expect(user["admin"]).to eq false
    expect(User.count).to eq 1
  end

  it "cannot update user without auth token" do
    current_user = create(:user)
    params = {user:
      {
        first_name: "Lee",
        last_name: "Chow",
        username: "leechow",
        email: "lee@gmail.com"
      }
    }
    patch "/api/v1/users/#{current_user.id}", params: params

    expect(response.status).to eq 401
  end
end
