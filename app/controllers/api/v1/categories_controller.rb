class Api::V1::CategoriesController < ApplicationController
  # before_action :authenticate_user

  def index
    render json: Category.all, status: 200
  end

  def show
    category = Category.find_by(id: params[:id])
    if category
      render json: category, status: 200
    else
      render json: {:error => "Unable to find category with id: #{params[:id]}"},
                    status: 404
    end
  end
end
