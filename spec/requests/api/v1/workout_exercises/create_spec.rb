require 'rails_helper'

describe "WorkoutExercises" do
  it "can CREATE new workout_exercise" do
    workout = create(:workout)
    exercise = create(:exercise)

    params = {workout_exercise:
                {
                  sets: 4,
                  reps: 15,
                  status: "active",
                  exercise_id: exercise.id,
                }
              }

    post "/api/v1/workouts/#{workout.id}/exercises", params: params

    workout_exercise = JSON.parse(response.body)

    expect(response.status).to eq 201
    expect(workout_exercise["id"]).to be_a Integer
    expect(workout_exercise["sets"]).to be_a Integer
    expect(workout_exercise["reps"]).to be_a Integer
    expect(workout_exercise["workout_id"]).to be_a Integer
    expect(workout_exercise["exercise"]).to be_a Hash
    expect(workout_exercise["exercise"]["name"]).to be_a String
    expect(workout_exercise["exercise"]["image"]).to be_a String
    expect(workout_exercise["exercise"]["description"]).to be_a String
  end

  it "Unable to create with missing attributes" do
    workout = create(:workout)
    exercise = create(:exercise)

    params = {workout_exercise:
                {
                  reps: 15,
                  status: "active",
                  exercise_id: exercise.id,
                }
              }

    post "/api/v1/workouts/#{workout.id}/exercises", params: params

    error = JSON.parse(response.body)

    expect(response.status).to eq 400
    expect(error["error"]).to eq "Missing parameters"
  end

end
