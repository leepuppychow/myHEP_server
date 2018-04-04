require 'rails_helper'

describe "Workout_Exercises" do
  it "SHOW individual workout-exercise" do
    day1 = create(:weekday)
    day2 = create(:weekday)
    w = create(:workout)
    ex1 = create(:exercise)
    ex2 = create(:exercise)
    we1 = create(:workout_exercise, workout: w, exercise: ex1)
    we2 = create(:workout_exercise, workout: w, exercise: ex2)
    w.weekdays << [day1, day2]

    get "/api/v1/workouts/#{w.id}/exercises/#{ex1.id}"

    workout_exercise = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(workout_exercise["id"]).to eq we1.id
    expect(workout_exercise["sets"]).to be_a Integer
    expect(workout_exercise["reps"]).to be_a Integer
    expect(workout_exercise["workout_id"]).to be_a Integer
    expect(workout_exercise["exercise"]).to be_a Hash
    expect(workout_exercise["exercise"]["name"]).to be_a String
    expect(workout_exercise["exercise"]["image"]).to be_a String
    expect(workout_exercise["exercise"]["description"]).to be_a String
  end

end
