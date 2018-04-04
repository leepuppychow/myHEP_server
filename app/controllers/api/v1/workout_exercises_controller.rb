class Api::V1::WorkoutExercisesController < ApplicationController
  before_action :find_workout, except: [:index, :create]
  before_action :find_exercise, except: [:index, :create]

  def show
    if @workout && @exercise
      # workout_exercise = WorkoutExercise.find_by(workout_id: @workout,
      #                                           exercise_id: @exercise)
      render json: workout_exercise, status: 200
    else
      render json: {:error => error_messages(:show)}, status: 404
    end
  end

  def destroy
    if @workout && @exercise
      workout_exercise.destroy
      render json: {}, status: 204
    else
      render json: {:error => error_messages(:destroy)}, status: 404
    end
  end

  private

    def find_workout
      @workout ||= Workout.find_by(id: params[:workout_id])
    end

    def find_exercise
      @exercise ||= Exercise.find_by(id: params[:exercise_id])
    end

    def workout_exercise
      WorkoutExercise.find_by(workout_id: @workout,
                              exercise_id: @exercise)
    end

    def error_messages(action)
      errors = {
        :show => "Cannot find workout_exercise",
        :create => "Unable to create workout_exercise",
        :update => "Error updating workout_exercise",
        :destroy => "Unable to delete workout_exercise",
      }
      errors[action]
    end
end
