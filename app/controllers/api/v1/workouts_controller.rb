class Api::V1::WorkoutsController < ApplicationController
  before_action :authenticate_user
  before_action :find_workout, except: [:index, :create]

  def index
    render json: current_user.workouts, status: 200
  end

  def show
    if @workout
      render json: @workout, status: 200
    else
      render json: {:error => error_messages(:show)}, status: 404
    end
  end

  def create
    workout = current_user.workouts.new(workout_params)
    if workout.save
      add_weekdays_to(workout)
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

  def destroy
    if @workout
      @workout.destroy
      render json: {}, status: 204
    else
      render json: {:error => error_messages(:destroy)}, status: 404
    end
  end

  private

    def workout_params
      params.require(:workout).permit(:name, :status, :therapist)
    end

    def weekday_params
      params.require(:workout).permit(:weekdays => [])[:weekdays]
    end

    def find_workout
      @workout ||= current_user.workouts.find_by(id: params[:id])
    end

    def add_weekdays_to(workout)
      if weekday_params
        weekday_params.each {|id| workout.weekdays << Weekday.find(id)}
      end
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
