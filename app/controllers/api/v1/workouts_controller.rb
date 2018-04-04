class Api::V1::WorkoutsController < ApplicationController
  before_action :find_workout, except: [:index, :create]

  def index
    render json: Workout.all, status: 200
    # render json: current_user.workouts, status: 200
  end

  def show
    if @workout
      render json: @workout, status: 200
    else
      render json: {:error => error_messages(:show)}, status: 404
    end
  end

  def create
    workout = Workout.new(workout_params)
    if workout.save
      render json: workout, status: 201
    else
      render json: {:error => error_messages(:create)}, status: 400
    end
  end

  def update
    if @workout && !workout_params.empty?
      @workout.update(workout_params)
      render json: @workout, status: 204
    else
      render json: {:error => error_messages(:update)}, status: 404
    end
  end

  private

    def find_workout
      @workout ||= Workout.find_by(id: params[:id])
    end

    def workout_params
      params.require(:workout).permit(:name, :weekday, :status, :therapist)
    end

    def error_messages(action)
      errors = {
        :show => "Cannot find workout with id: #{params[:id]}",
        :create => "Unable to create workout",
        :update => "Error updating workout with id: #{params[:id]}",
        :destroy => "Unable to delete workout with id: #{params[:id]}",
      }
      errors[action]
    end

end
