require 'rails_helper'

describe "Workouts" do
  it "Show endpoint will send a single workout" do
    day1 = create(:weekday)
    day2 = create(:weekday)
    w = create(:workout)
    ex1 = create(:exercise)
    ex2 = create(:exercise)
    we1 = create(:workout_exercise, workout: w, exercise: ex1)
    we2 = create(:workout_exercise, workout: w, exercise: ex2)
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
    create_list(:workout, 2)

    get '/api/v1/workouts/wheee'
    error = JSON.parse(response.body)

    expect(response.status).to eq 404
    expect(error["error"]).to eq "Cannot find workout with id: wheee"
  end
end
