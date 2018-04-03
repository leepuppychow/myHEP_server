class Api::V1::ExercisesController < ApplicationController
  before_action :find_exercise, except: [:index, :create]

  def index
    exercises = Exercise.all
    render json: exercises, status: 200
  end

  def show
    if @exercise
      render json: @exercise, status: 200
    else
      render json: {:message => "Cannot find exercise with id: #{params[:id]}"},
                    status: 404
    end
  end

  def create
    exercise = Exercise.new(exercise_params)
    if exercise.save
      render json: exercise, status: 201
    else
      render json: {:message => "Unable to create exercise"}, status: 400
    end
  end

  def update
    if @exercise
      @exercise.update(exercise_params)
      render json: @exercise, status: 204
    else
      render json: {:message => "Cannot find exercise with id: #{params[:id]}"},
                    status: 404
    end
  end

  def destroy
    if @exercise
      @exercise.destroy
      render json: {}, status: 204
    else
      render json: {:message => "Unable to delete exercise with id: #{params[:id]}"},
                    status: 404
    end
  end

  private

    def find_exercise
      @exercise ||= Exercise.find_by(id: params[:id])
    end

    def exercise_params
      params.require(:exercise).permit(:name, :image, :description)
    end

end
