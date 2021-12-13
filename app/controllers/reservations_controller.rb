class ReservationsController < ApplicationController
  def index
    @user = User.where(id: params[:user_id]).first
    @reservations = @user.reservations
    render json: @reservations
  end

  def show
    @reservation = Reservation.find(params[:id])
    render json: @reservation
  end

  def create
    @user = User.find(params[:user_id])
    @reservation = @user.reservations.create(reservation_params)
    if @reservation.save
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private 
  def reservation_params
    params.require(:reservation).permit(:rent_duration)
  end
end
