module Api
  module V1
    class ExpensesController < ApplicationController
      def create
        result = CreateExpense.call expense_params

        if result.success?
          render json: {
            success: true
          }, status: :ok
        else
          render json: {
            success: false,
            errors: result.errors.first.message
          }, status: :internal_server_error
        end
      end

      private

      def expense_params
        params.permit(
          :group_id,
          payer: [
            :id,
            :expense_reason,
            :payment_amount
          ],
          payee_ids: []
        )
      end
    end
  end
end