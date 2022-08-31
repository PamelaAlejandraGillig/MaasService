# frozen_string_literal: true

module Api
  module V1
    class TurnsController < ApplicationController
      before_action :authorize_access_request!
      before_action :set_turn, only: [:shifts_available]

      def shifts_available
        result = @turns.get_shifts
        render json: result
      end

      def get_turns
        turns_list = Turn.where('contract_id = ?', params[:id])
        render json: turns_list
      end

      private

      def set_turn
        @turns = Turn.find(params[:id])
      end
    end
  end
end
