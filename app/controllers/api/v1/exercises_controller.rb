class Api::V1::ExercisesController < ApplicationController
  before_action :find_exercise, except: [:index]

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

  def destroy
    @exercise.destroy
    render json: {}, status: 204
  end

  private

    def find_exercise
      @exercise ||= Exercise.find_by(id: params[:id])
    end

end
