module Api
  module V1
    class ContractsController < ApplicationController
      before_action :authorize_access_request!
      before_action :set_contract, only: [:show]

      def index
        @contract = Contract.all
        render json: @contract
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
