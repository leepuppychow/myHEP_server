class Api::V1::ExercisesController < ApplicationController

  def index
    render json: Exercise.all
  end

  def show
    render json: Exercise.find(params[:id])
  end
  
end
