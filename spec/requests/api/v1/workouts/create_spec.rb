require 'rails_helper'

describe "Workouts" do
  before :each do
    create_list(:weekday, 7)
  end

  it "can create new workout" do
    current_user = create(:user)
    params = {workout:
                {
                  name: "Hard day",
                  status: "done",
                  therapist: "Lee",
                  weekdays: [1, 3]
                }
              }
    post "/api/v1/workouts", params: params, headers: auth_headers(current_user)

    workout = JSON.parse(response.body)

    expect(response.status).to eq 201
    expect(workout["name"]).to eq "Hard day"
    expect(workout["status"]).to eq "done"
    expect(workout["therapist"]).to eq "Lee"
    expect(workout["weekdays"]).to be_a Array
    expect(workout["weekdays"].count).to eq 2
  end

  it "Unable to create with missing name attribute" do
    current_user = create(:user)
    params = {workout:
                {
                  therapist: "Lee"
                }
              }
    post "/api/v1/workouts", params: params, headers: auth_headers(current_user)

    error = JSON.parse(response.body)

    expect(response.status).to eq 400
    expect(error["error"]).to eq "Unable to create workout"
  end

  it "cannot access route without Authorization header" do
    current_user = create(:user)
    params = {workout:
                {
                  name: "Hard day",
                  status: "done",
                  therapist: "Lee",
                  weekdays: [1, 3]
                }
              }
    post "/api/v1/workouts", params: params

    expect(response.status).to eq 401
  end
end
