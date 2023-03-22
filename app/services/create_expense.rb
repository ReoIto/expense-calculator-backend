class CreateExpense
  include BaseService

  def initialize params
    @group_id = params[:group_id]
    @payer_params = params[:payer]
    @payee_ids = params[:payee_ids]
  end

  def call
    ActiveRecord::Base.transaction do
      group = Group.find group_id
      payer = User.find payer_params[:id]
      payees = User.where id: payee_ids
      payment_amount = payer_params[:payment_amount].to_i

      expense = group.expenses.create!(
        expense_reason: payer_params[:expense_reason],
        amount: payment_amount
      )
      expense.reload
      expense.payer_details.create!(
        user: payer,
        amount: 0
      )

      if payees.include? payer
        payees.map do |payee|
          next if payee == payer
          expense.payee_details.create!(
            user: payee,
            amount: payment_amount / payees.length
          )
        end
      else
        payees.map do |payee|
          expense.payee_details.create!(
            user: payee,
            amount: payment_amount / (payees.length - 1)
          )
        end
      end
      data = {
        expense: expense,
        payer_details: expense.payer_details,
        payee_details: expense.payee_details
      }

      ServiceResult.new success: true, data: data
    end
  rescue StandardError => e
    puts e
    ServiceResult.new success: false, errors: [e]
  end

  private
  attr_reader :group_id, :payer_params, :payee_ids
end