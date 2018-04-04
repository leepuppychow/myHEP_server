require 'rails_helper'

describe "Workouts" do
  it "can create new workout" do
    params = {workout:
                {
                  name: "Hard day",
                  weekday: "Monday",
                  status: "done",
                  therapist: "Lee",
                }
              }
    post "/api/v1/workouts", params: params

    workout = JSON.parse(response.body)

    expect(response.status).to eq 201
    expect(workout["name"]).to eq "Hard day"
    expect(workout["weekday"]).to eq "Monday"
    expect(workout["status"]).to eq "done"
    expect(workout["therapist"]).to eq "Lee"
  end

  it "Unable to create with missing attributes" do
    params = {exercise:
                {
                  name: "Easy Day",
                }
              }
    post "/api/v1/exercises", params: params

    error = JSON.parse(response.body)

    expect(response.status).to eq 400
    expect(error["error"]).to eq "Unable to create exercise"
  end
end
