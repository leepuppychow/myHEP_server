require 'rails_helper'

describe "Workouts" do
  it "Show endpoint will send a single workout" do
    day1 = create(:weekday)
    day2 = create(:weekday)
    w = create(:workout)
    w.weekdays << [day1, day2]

    get "/api/v1/workouts/#{w.id}"

    workout = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(workout["name"]).to be_a(String)
    expect(workout["status"]).to be_a(String)
    expect(workout["therapist"]).to be_a(String)
    expect(workout["created_at"]).to be_a(String)
    expect(workout["updated_at"]).to be_a(String)
    expect(workout["weekdays"]).to be_a(Array)
    expect(workout["weekdays"].count).to eq 2
  end

  it "will return 404 for non-existing ID" do
    create_list(:workout, 2)

    get '/api/v1/workouts/wheee'
    error = JSON.parse(response.body)

    expect(response.status).to eq 404
    expect(error["error"]).to eq "Cannot find workout with id: wheee"
  end
end
