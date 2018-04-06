class Api::V1::ExercisesController < ApplicationController
  before_action :authenticate_user
  before_action :find_exercise, except: [:index, :create]

  def index
    render json: Exercise.all, status: 200
  end

  def show
    if @exercise
      render json: @exercise, status: 200
    else
      render json: {:error => error_messages(:show)}, status: 404
    end
  end

  def create
    exercise = Exercise.new(exercise_params)
    if exercise.save
      render json: exercise, status: 201
    else
      render json: {:error => error_messages(:create)}, status: 400
    end
  end

  def update
    if @exercise && !exercise_params.empty?
      @exercise.update(exercise_params)
      render json: @exercise, status: 204
    else
      render json: {:error => error_messages(:update)}, status: 404
    end
  end

  def destroy
    if @exercise && current_user.admin?
      @exercise.destroy
      render json: {}, status: 204
    else
      render json: {:error => error_messages(:destroy)}, status: 404
    end
  end

  private

    def find_exercise
      @exercise ||= Exercise.find_by(id: params[:id])
    end

    def exercise_params
      params.require(:exercise).permit(:name, :image, :description)
    end

    def error_messages(action)
      errors = {
        :show => "Cannot find exercise with id: #{params[:id]}",
        :create => "Unable to create exercise",
        :update => "Error updating exercise with id: #{params[:id]}",
        :destroy => "Unable to delete exercise with id: #{params[:id]}",
      }
      errors[action]
    end

end
