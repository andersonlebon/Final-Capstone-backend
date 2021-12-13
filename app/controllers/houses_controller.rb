class HousesController < ApplicationController
  def index
    @house = House.all
    render json: @house
  end

  def show
    @house = House.where(id: params[:id]).first
    render json: @house
  end

  def create
    @user = User.find(params[:user_id])
    @house = @user.houses.create(house_params)
    if @house.save
      render json: @house
    else
      render json: @house.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @house = House.where(params[:id]).first
    @house.destroy
    head :no_content
    render json: { message: 'House successfully deleted' }
  end 
  

  private

  def house_params
    params.require(:house).permit(:title, :discount, :house_description, :image, :price, :user_id, :location,
                                  :availability)
  end
end
