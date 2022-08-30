module Api
  module V1
    class TurnsController < ApplicationController
      before_action :authorize_access_request!, except: [:shifts_available]
      before_action :set_turn, only: [:shifts_available]

      def shifts_available
        result = @turns.get_shifts
        render json: result
      end

      private

      def set_turn
        @turns = Turn.find_by(contract_id: params[:id], week: params[:week])
      end
    end
  end
end
