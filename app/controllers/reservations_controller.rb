class ReservationsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @reservations = @user.reservations
    render json: @reservations
  end

  def show
    @reservation = Reservation.find(params[:id])
    render json: @reservation
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private 
  def reservation_params
    params.require(:resevation).permit(:rent_duration)
  end
end
