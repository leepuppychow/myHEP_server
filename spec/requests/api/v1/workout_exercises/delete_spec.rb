require 'rails_helper'

describe "Workout_Exercises" do
  it "DELETE individual workout-exercise" do
    day1 = create(:weekday)
    day2 = create(:weekday)
    w = create(:workout)
    ex1 = create(:exercise)
    ex2 = create(:exercise)
    we1 = create(:workout_exercise, workout: w, exercise: ex1)
    we2 = create(:workout_exercise, workout: w, exercise: ex2)
    w.weekdays << [day1, day2]

    delete "/api/v1/workouts/#{w.id}/exercises/#{ex1.id}"

    expect(response.status).to eq 204
    expect(response.body).to eq ""

    workout_exercise = WorkoutExercise.find_by(workout_id: w,
                                              exercise_id: ex1)
    expect(workout_exercise).to eq nil
  end

  it "Cannot delete non-existing workout" do
    delete "/api/v1/workouts/10/exercises/10"

    error = JSON.parse(response.body)

    expect(response.status).to eq 404
    expect(error["error"]).to eq "Unable to delete workout_exercise"
  end


end
