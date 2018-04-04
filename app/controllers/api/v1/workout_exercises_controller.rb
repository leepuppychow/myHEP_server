class Api::V1::WorkoutExercisesController < ApplicationController
  before_action :find_workout_exercise, except: [:index, :create]

  def show
    if @workout_exercise
      render json: @workout_exercise, status: 200
    else
      render json: {:error => error_messages(:show)}, status: 404
    end
  end

  private

    def find_workout_exercise
      @workout_exercise ||= WorkoutExercise.find_by(id: params[:id])
    end

    def error_messages(action)
      errors = {
        :show => "Cannot find workout_exercise with id: #{params[:id]}",
        :create => "Unable to create workout_exercise",
        :update => "Error updating workout_exercise with id: #{params[:id]}",
        :destroy => "Unable to delete workout_exercise with id: #{params[:id]}",
      }
      errors[action]
    end


end
