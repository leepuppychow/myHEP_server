require 'rails_helper'

describe "Workouts" do
  it "can create new workout" do
    # user = create(:user)
    params = {workout:
                {
                  name: "Hard day",
                  status: "done",
                  therapist: "Lee"
                  # user_id: user.id
                }
              }
    post "/api/v1/workouts", params: params

    workout = JSON.parse(response.body)

    expect(response.status).to eq 201
    expect(workout["name"]).to eq "Hard day"
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
