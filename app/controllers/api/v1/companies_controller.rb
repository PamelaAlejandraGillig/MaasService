# frozen_string_literal: true

module Api
  module V1
    class CompaniesController < ApplicationController
      before_action :authorize_access_request!

      def index
        @companies = Company.all
        render json: @companies
      end

      def show; end
    end
  end
end
