module Api
  module V1
    class EmployeesController < ApplicationController
      before_action :authorize_access_request!
      before_action :set_employee, only: [:show]

      def index
        @employees = Employee.all
        render json: @employees
      end

      def show
        render json: @employee
      end

      private

      def set_employee
        @employee = Employee.find(params[:id])
      end
    end
  end
end
