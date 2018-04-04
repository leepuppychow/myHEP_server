require 'rails_helper'

describe "Workouts" do
  it "Delete workout" do
    create_list(:workout, 2)

    delete '/api/v1/workouts/1'

    expect(response.status).to eq 204
    expect(response.body).to eq("")

    workout = Workout.find_by(id: 1)
    expect(workout).to eq nil
  end

  it "Cannot delete non-existing workout" do
    create_list(:workout, 2)

    delete '/api/v1/workouts/100'

    error = JSON.parse(response.body)

    expect(response.status).to eq 404
    expect(error["error"]).to eq "Unable to delete workout with id: 100"
  end
end
