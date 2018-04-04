require 'rails_helper'

describe "Workouts" do
  it "can update workout" do
    create_list(:workout, 2)
    params = {workout:
                {
                  name: "Hard day",
                  weekday: "Monday",
                  status: "done",
                  therapist: "Lee",
                }
              }
    put "/api/v1/workouts/1", params: params

    workout = Workout.find(1)
    expect(response.status).to eq 204
    expect(workout["name"]).to eq "Hard day"
    expect(workout["weekday"]).to eq "Monday"
    expect(workout["status"]).to eq "done"
    expect(workout["therapist"]).to eq "Lee"
  end

  it "Unable to update non-existing workout" do
    create_list(:workout, 2)
    params = {workout:
                {
                  name: "Hard day",
                  weekday: "Monday",
                }
              }
    patch "/api/v1/workouts/100", params: params
    error = JSON.parse(response.body)

    expect(response.status).to eq 404
    expect(error["error"]).to eq "Error updating workout with id: 100"
  end

  it "Cannot update existing workout with invalid params" do
    create_list(:workout, 2)
    params = {workout:
                {
                  blah: "squats",
                  blerg: "sit in chair"
                }
              }
    patch "/api/v1/workouts/1", params: params
    error = JSON.parse(response.body)

    expect(response.status).to eq 404
    expect(error["error"]).to eq "Error updating workout with id: 1"
  end

end
