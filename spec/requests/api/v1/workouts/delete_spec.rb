require 'rails_helper'

describe "Workouts" do
  it "Deletes workout" do
    current_user = create(:user)
    workout = create(:workout, user: current_user)

    delete '/api/v1/workouts/1', headers: auth_headers(current_user)

    expect(response.status).to eq 204
    expect(response.body).to eq ""

    workout = Workout.find_by(id: workout.id)
    expect(workout).to eq nil
  end

  it "Cannot delete non-existing workout" do
    current_user = create(:user)
    workout = create(:workout, user: current_user)

    delete '/api/v1/workouts/100', headers: auth_headers(current_user)

    error = JSON.parse(response.body)

    expect(response.status).to eq 404
    expect(error["error"]).to eq "Unable to delete workout with id: 100"
  end

  it "Cannot delete with authorization token" do
    current_user = create(:user)
    workout = create(:workout, user: current_user)

    delete '/api/v1/workouts/100'

    expect(response.status).to eq 401
  end 
end
