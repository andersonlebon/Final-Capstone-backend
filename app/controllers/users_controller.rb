class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render json: @user.houses
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end 

  private
    def user_params
      params.require(:user).permit(:name)
    end
  
end
