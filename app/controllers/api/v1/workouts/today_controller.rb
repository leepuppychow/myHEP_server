class Api::V1::Workouts::TodayController < ApplicationController

  def index
    render json: current_user.workouts.today, status: 200
  end

end
