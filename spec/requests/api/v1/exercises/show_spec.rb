require 'rails_helper'

describe "Exercises API" do
  it "Show endpoint will send a JSON object for one exercise" do
    current_user = create(:user)
    create_list(:exercise, 2)

    get '/api/v1/exercises/1', headers: auth_headers(current_user)

    exercise = JSON.parse(response.body)

    expect(exercise["name"]).to be_a(String)
    expect(exercise["image"]).to be_a(String)
    expect(exercise["description"]).to be_a(String)
    expect(exercise["created_at"]).to be_a(String)
    expect(exercise["updated_at"]).to be_a(String)
  end

  it "will return 404 for non-existing ID" do
    current_user = create(:user)
    create_list(:exercise, 2)

    get '/api/v1/exercises/wheee', headers: auth_headers(current_user)
    error = JSON.parse(response.body)

    expect(response.status).to eq 404
    expect(error["error"]).to eq "Cannot find exercise with id: wheee"
  end
end
