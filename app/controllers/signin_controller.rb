# frozen_string_literal: true

class SigninController < ApplicationController
  before_action :authorize_access_request!, only: [:destroy]
  before_action :set_user, only: [:create]

  def create
    if @user.authenticate(user_params[:password])
      payload = { user_id: @user.id }
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      tokens = session.login
      response.set_cookie(JWTSessions.access_cookie,
                          value: tokens[:access],
                          httponly: true,
                          secure: Rails.env.production?)
      render json: { csrf: tokens[:csrf] }
    else
      not_authorized
    end
  end

  def user_params
    params.permit(:email, :password)
  end

  def destroy
    session = JWTSessions::Session.new(payload: payload, namespace: "user_#{payload['user_id']}")
    session.flush_by_access_payload
    render json: :ok
  end

  private

  def set_user
    @user = User.find_by!(email: user_params[:email])
  end

  def not_found
    render json: { error: 'Cannot find email/password combination' }, status: :not_found
  end
end
