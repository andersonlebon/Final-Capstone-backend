class ReservationsController < ApplicationController
  def index
    @user = User.where(id: params[:user_id]).first
    @reservations = @user.reservations
    render json: @reservations
  end

  def show
    @reservation = Reservation.where(id: params[:id]).first
    render json: @reservation
  end

  def create
    @user = User.where(id: params[:user_id]).first
    @reservation = @user.reservations.create(reservation_params)
    @reservation.house_ids = params[:house_ids]

    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = Reservation.where(id: params[:id]).first
    # send a message if the reservation is deleted
    if @reservation.destroy
      render json: { message: 'Reservation deleted' }, status: :no_content
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:rent_duration, :rent_start_date, :rent_total_price)
  end
end
