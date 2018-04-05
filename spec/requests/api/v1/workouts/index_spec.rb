require 'rails_helper'

describe "Workouts" do
  it "Index endpoint will send an array of all workouts" do
    other_workouts = create_list(:workout, 2)
    current_user = create(:user)
    workouts = create_list(:workout, 3)
    current_user.workouts << workouts

    get '/api/v1/workouts', headers: auth_headers(current_user)

    workouts = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(workouts.count).to eq(3)
    expect(workouts.first["name"]).to be_a(String)
    expect(workouts.first["status"]).to be_a(String)
    expect(workouts.first["therapist"]).to be_a(String)
    expect(workouts.first["created_at"]).to be_a(String)
    expect(workouts.first["updated_at"]).to be_a(String)
  end

  it "cannot access route without token" do
    workouts = create_list(:workout, 3)
    get '/api/v1/workouts'

    expect(response.status).to eq 401
  end
end
