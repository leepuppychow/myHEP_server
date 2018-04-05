require 'rails_helper'

describe "Workouts" do
  before :each do
    create_list(:weekday, 7)
  end

  it "can update workout" do
    current_user = create(:user)
    workout = create(:workout, user: current_user)
    sunday = Weekday.find(1)
    workout.weekdays << sunday

    params = {workout:
                {
                  name: "Hard day",
                  therapist: "Somebody",
                  weekdays: [3,5,7]
                }
              }
    put "/api/v1/workouts/#{workout.id}", params: params, headers: auth_headers(current_user)

    workout = Workout.find(workout.id)

    expect(response.status).to eq 204
    expect(workout["name"]).to eq "Hard day"
    expect(workout["therapist"]).to eq "Somebody"
    expect(workout.weekdays.count).to eq 3
  end

  it "Unable to update non-existing workout" do
    current_user = create(:user)
    not_this_users_workout = create(:workout)
    workout = create(:workout, user: current_user)

    params = {workout:
                {
                  name: "Hard day",
                  therapist: "Somebody"
                }
              }
    put "/api/v1/workouts/#{not_this_users_workout.id}",
      params: params, headers: auth_headers(current_user)

    error = JSON.parse(response.body)

    expect(response.status).to eq 404
    expect(error["error"]).to eq "Error updating workout"
  end

  it "Cannot update existing workout with invalid params" do
    current_user = create(:user)
    workout = create(:workout, user: current_user)
    sunday = Weekday.first
    workout.weekdays << sunday

    params = {workout:
                {
                  blah: "squats",
                  blerg: "sit in chair"
                }
              }
    put "/api/v1/workouts/#{workout.id}", params: params, headers: auth_headers(current_user)

    error = JSON.parse(response.body)

    expect(response.status).to eq 404
    expect(error["error"]).to eq "Error updating workout"
  end

  it "cannot access route without Authorization header" do
    current_user = create(:user)
    workout = create(:workout, user: current_user)
    params = {workout:
                {
                  name: "Hard day",
                  status: "done",
                  therapist: "Lee",
                  weekdays: [1, 3]
                }
              }
    patch "/api/v1/workouts/#{workout.id}", params: params

    expect(response.status).to eq 401
  end


end
