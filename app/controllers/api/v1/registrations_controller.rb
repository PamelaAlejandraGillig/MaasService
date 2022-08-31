# frozen_string_literal: true

module Api
  module V1
    class RegistrationsController < ApplicationController
      before_action :authorize_access_request!

      def create_massive
        @registration = Registration.create(registrations_params)
        render json: @registration
      end

      def registrations_params
        params[:_json].map { |m| m.permit(:date_from, :date_end, :user_id, :turn_id) }
      end
    end
  end
end
