require 'rails_helper'

describe "Workout_Exercises" do
  it "SHOW individual workout-exercise" do
    current_user = create(:user)
    w = create(:workout)
    current_user.workouts << w
    ex1 = create(:exercise)
    ex2 = create(:exercise)
    we1 = create(:workout_exercise, workout: w, exercise: ex1)
    we2 = create(:workout_exercise, workout: w, exercise: ex2)

    get "/api/v1/workouts/#{w.id}/exercises/#{ex1.id}",
      headers: auth_headers(current_user)

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

  it "cannot access route without token" do
    current_user = create(:user)
    w = create(:workout)
    current_user.workouts << w
    ex1 = create(:exercise)
    ex2 = create(:exercise)
    we1 = create(:workout_exercise, workout: w, exercise: ex1)
    we2 = create(:workout_exercise, workout: w, exercise: ex2)

    get "/api/v1/workouts/#{w.id}/exercises/#{ex1.id}"

    expect(response.status).to eq 401
  end

end
