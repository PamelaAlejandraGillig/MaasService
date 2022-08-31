# frozen_string_literal: true

module Api
  module V1
    class ContractsController < ApplicationController
      before_action :authorize_access_request!
      before_action :set_contract, only: [:show]

      def index
        @contracts = Contract.where('company_id = ?', params[:company_id])
        render json: @contracts
      end

      def show
        render json: @contract
      end

      private

      def set_contract
        @contract = Contract.find(params[:id])
      end
    end
  end
end
