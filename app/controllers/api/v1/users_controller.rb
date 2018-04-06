class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user, except: :create

  def show
    if same_user
      render json: current_user, status: 200
    else
      render json: {"error": "Unable to find user"}, status: 404
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 201
    else
      render json: {"error": "Unable to create user"}, status: 400
    end
  end

  def update
    if same_user && current_user.update(user_params)
      render json: current_user, status: 204
    else
      render json: {"error": "Unable to update user"}, status: 400
    end
  end

  def destroy
    if same_user && current_user.destroy
      render json: {}, status: 204
    else
      render json: {"error": "Unable to delete user"}, status: 404
    end
  end

  private

    def same_user
      current_user.id == params[:id].to_i
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :username,
                                    :password, :email)
    end
end
