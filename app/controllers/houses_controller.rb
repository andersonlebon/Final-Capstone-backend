class HousesController < ApplicationController
  def index
    @house = House.all
    render json: @house
  end

  def show
    @house = House.where(id: params[:id]).first
    render json: @house, status: :ok
  end

  def create
    @user = User.find(params[:user_id])
    @house = @user.houses.create(house_params)
    if @house.save
      render json: @house, status: :created
    else
      render json: @house.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @house = House.where(id: params[:id]).first
    @house.destroy
    render json: { message: 'House successfully deleted' }, status: :no_content
  end

  private

  def house_params
    params.permit(:title, :discount, :house_description, :image, :price, :user_id, :location,
                                  :availability)
  end
end
