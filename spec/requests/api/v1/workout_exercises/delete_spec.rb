require 'rails_helper'

describe "Workout_Exercises" do
  it "DELETE individual workout-exercise" do
    current_user = create(:user)
    w = create(:workout, user: current_user)
    ex1 = create(:exercise)
    ex2 = create(:exercise)
    we1 = create(:workout_exercise, workout: w, exercise: ex1)
    we2 = create(:workout_exercise, workout: w, exercise: ex2)

    delete "/api/v1/workouts/#{w.id}/exercises/#{ex1.id}",
      headers: auth_headers(current_user)

    expect(response.status).to eq 204
    expect(response.body).to eq ""

    workout_exercise = WorkoutExercise.find_by(workout_id: w,
                                              exercise_id: ex1)
    expect(workout_exercise).to eq nil
  end

  it "Cannot delete a workout_exercise not belonging to user" do
    current_user = create(:user)
    w = create(:workout, user: current_user)
    ex1 = create(:exercise)
    ex2 = create(:exercise)
    we1 = create(:workout_exercise, workout: w, exercise: ex1)
    we2 = create(:workout_exercise, workout: w, exercise: ex2)

    another_user = create(:user)
    w2 = create(:workout, user: another_user)
    we3 = create(:workout_exercise, workout: w2, exercise: ex1)
    we4 = create(:workout_exercise, workout: w2, exercise: ex2)

    delete "/api/v1/workouts/#{we3.id}/exercises/#{ex1.id}",
      headers: auth_headers(current_user)

    error = JSON.parse(response.body)

    expect(response.status).to eq 404
    expect(error["error"]).to eq "Unable to delete workout_exercise"
  end

  it "cannot delete without token" do
    current_user = create(:user)
    w = create(:workout, user: current_user)
    ex1 = create(:exercise)
    ex2 = create(:exercise)
    we1 = create(:workout_exercise, workout: w, exercise: ex1)
    we2 = create(:workout_exercise, workout: w, exercise: ex2)

    delete "/api/v1/workouts/#{w.id}/exercises/#{ex1.id}"
    
    expect(response.status).to eq 401
  end



end
