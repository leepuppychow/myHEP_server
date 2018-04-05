require 'rails_helper'

describe "Workouts" do
  it "Show endpoint will send a single workout" do
    current_user = create(:user)
    day1 = create(:weekday)
    day2 = create(:weekday)
    not_this_users_workout = create(:workout)
    w = create(:workout, user: current_user)
    ex1 = create(:exercise)
    ex2 = create(:exercise)
    we1 = create(:workout_exercise, workout: w, exercise: ex1)
    we2 = create(:workout_exercise, workout: w, exercise: ex2)
    w.weekdays << [day1, day2]

    get "/api/v1/workouts/#{not_this_users_workout.id}",
      headers: auth_headers(current_user)
    expect(response.status).to eq 404

    get "/api/v1/workouts/#{w.id}", headers: auth_headers(current_user)

    workout = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(workout["name"]).to be_a(String)
    expect(workout["status"]).to be_a(String)
    expect(workout["therapist"]).to be_a(String)
    expect(workout["created_at"]).to be_a(String)
    expect(workout["updated_at"]).to be_a(String)
    expect(workout["weekdays"]).to be_a(Array)
    expect(workout["weekdays"].count).to eq 2
    expect(workout["workout_exercises"]).to be_a(Array)
    expect(workout["workout_exercises"].count).to eq 2
    expect(workout["workout_exercises"].first["sets"]).to be_a(Integer)
    expect(workout["workout_exercises"].first["reps"]).to be_a(Integer)
    expect(workout["workout_exercises"].first["status"]).to be_a(String)
    expect(workout["workout_exercises"].first["name"]).to be_a(String)
    expect(workout["workout_exercises"].first["image"]).to be_a(String)
    expect(workout["workout_exercises"].first["description"]).to be_a(String)
  end

  it "will return 404 for non-existing ID" do
    current_user = create(:user)
    workouts = create_list(:workout, 2)
    current_user.workouts << workouts

    get '/api/v1/workouts/wheee', headers: auth_headers(current_user)
    error = JSON.parse(response.body)

    expect(response.status).to eq 404
    expect(error["error"]).to eq "Cannot find workout with id: wheee"
  end

  it "cannot access route without token" do
    workouts = create_list(:workout, 3)
    get '/api/v1/workouts/1'

    expect(response.status).to eq 401
  end
end
