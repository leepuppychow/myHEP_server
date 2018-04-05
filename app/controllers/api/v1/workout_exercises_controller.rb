class Api::V1::WorkoutExercisesController < ApplicationController
  before_action :authenticate_user
  before_action :find_workout
  before_action :find_exercise

  def show
    if @workout && @exercise
      render json: workout_exercise, status: 200
    else
      render json: {:error => error_messages(:show)}, status: 404
    end
  end

  def create
    if @workout
      exercise = @workout.workout_exercises.new(workout_exercise_params)
      save_workout_exercise(exercise)
    else
      render json: {:error => error_messages(:create)}, status: 400
    end
  end

  def save_workout_exercise(exercise)
    if exercise.save
      render json: exercise, status: 201
    else
      render json: {:error => error_messages(:missing_params)}, status: 400
    end
  end

  def update
    if @workout && @exercise && !workout_exercise_params.empty?
      workout_exercise.update(workout_exercise_params)
      render json: workout_exercise, status: 204
    else
      render json: {:error => error_messages(:update)}, status: 404
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

    def workout_exercise_params
      params.require(:workout_exercise).permit(:sets, :reps,
                                              :status, :exercise_id)
    end

    def find_workout
      @workout ||= current_user.workouts.find_by(id: params[:workout_id])
    end

    def find_exercise
      @exercise ||= Exercise.find_by(id: params[:exercise_id])
    end

    def workout_exercise
      WorkoutExercise.find_by(workout_id: @workout, exercise_id: @exercise)
    end

    def error_messages(action)
      errors = {
        :show => "Cannot find workout_exercise",
        :create => "Unable to create workout_exercise",
        :missing_params => "Missing parameters",
        :update => "Error updating workout_exercise",
        :destroy => "Unable to delete workout_exercise",
      }
      errors[action]
    end
end
