class SessionsController < ApplicationController
  def create
    secret_key_base = ENV['secret_key_base'] || Rails.application.secret_key_base

    # find and check if the user is authenticated
    user = User.where(name: session_params[:name]).first
    if user
      payload = { name: session_params[:name], user_id: user.id }
      exp = 24.hours.from_now
      payload[:exp] = exp.to_i
      token = JWT.encode payload, secret_key_base, 'HS256'
      render json: { token: token }, status: :created
    else
      render json: { errors: 'Invalid username' }, status: :unauthorized
    end
  end

  private

  def session_params
    params.require(:session).permit(:name)
  end
end
