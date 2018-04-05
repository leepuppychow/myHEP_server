require 'rails_helper'

describe "WorkoutExercises" do
  it "can UPDATE workout_exercise" do
    current_user = create(:user)
    workout = create(:workout, user: current_user)
    exercise = create(:exercise)
    we1 = create(:workout_exercise, workout: workout, exercise: exercise)

    params = {workout_exercise:
                {
                  sets: 4,
                  reps: 15,
                  status: "inactive",
                }
              }

    put "/api/v1/workouts/#{workout.id}/exercises/#{exercise.id}", params: params,
      headers: auth_headers(current_user)

    workout_exercise = WorkoutExercise.find_by(workout_id: workout,
                                              exercise_id: exercise)
    expect(response.status).to eq 204
    expect(workout_exercise["id"]).to be_a Integer
    expect(workout_exercise["sets"]).to eq 4
    expect(workout_exercise["reps"]).to eq 15
    expect(workout_exercise["status"]).to eq "inactive"
    expect(workout_exercise["workout_id"]).to be_a Integer
    expect(workout_exercise["exercise_id"]).to be_a Integer
  end

  it "Unable to update non-existing workout_exercise" do
    current_user = create(:user)
    workout = create(:workout, user: current_user)
    exercise = create(:exercise)
    we1 = create(:workout_exercise, workout: workout, exercise: exercise)

    params = {workout_exercise:
                {
                  sets: 4,
                  reps: 15,
                  status: "inactive",
                }
              }

    put "/api/v1/workouts/100/exercises/#{exercise.id}", params: params,
      headers: auth_headers(current_user)

    error = JSON.parse(response.body)

    expect(response.status).to eq 404
    expect(error["error"]).to eq "Error updating workout_exercise"
  end

  it "Cannot update existing workout_exercise with invalid params" do
    current_user = create(:user)
    workout = create(:workout, user: current_user)
    exercise = create(:exercise)
    we1 = create(:workout_exercise, workout: workout, exercise: exercise)

    params = {workout_exercise:
                {
                  blah: 4,
                  blerg: 15,
                }
              }

    put "/api/v1/workouts/100/exercises/#{exercise.id}", params: params,
      headers: auth_headers(current_user)

    error = JSON.parse(response.body)

    expect(response.status).to eq 404
    expect(error["error"]).to eq "Error updating workout_exercise"
  end

  it "cannot update without token" do
    current_user = create(:user)
    workout = create(:workout, user: current_user)
    exercise = create(:exercise)
    we1 = create(:workout_exercise, workout: workout, exercise: exercise)

    params = {workout_exercise:
                {
                  sets: 4,
                  reps: 15,
                  status: "inactive",
                }
              }

    put "/api/v1/workouts/#{workout.id}/exercises/#{exercise.id}", params: params

    expect(response.status).to eq 401
  end
end
