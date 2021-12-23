class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show destroy]
  def index
    @user = User.find(params[:user_id])
    @reservations = @user.reservations
    @new_res = @reservations.map do |reservation|
      reservation.as_json.merge(house: reservation.house_ids[0] || {})
    end
    render json: @new_res
  end

  def show
    render json: @reservation
  end

  def create
    @user = User.find(params[:user_id])
    @reservation = @user.reservations.create(reservation_params)
    @reservation.house_ids = params[:house_ids]

    if @reservation.save
      render json: { message: 'Created' }, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @reservation.destroy
      render json: { message: 'Reservation deleted' }, status: :no_content
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private

   def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:rent_duration, :rent_start_date, :rent_total_price)
  end
end
