require 'rails_helper'

describe "Workouts" do
  it "Show endpoint will send a single workout" do
    create_list(:workout, 3)

    get '/api/v1/workouts/1'

    workout = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(workout["name"]).to be_a(String)
    expect(workout["weekday"]).to be_a(String)
    expect(workout["status"]).to be_a(String)
    expect(workout["therapist"]).to be_a(String)
    expect(workout["created_at"]).to be_a(String)
    expect(workout["updated_at"]).to be_a(String)
  end

  it "will return 404 for non-existing ID" do
    create_list(:workout, 2)

    get '/api/v1/workouts/wheee'
    error = JSON.parse(response.body)

    expect(response.status).to eq 404
    expect(error["error"]).to eq "Cannot find workout with id: wheee"
  end
end
