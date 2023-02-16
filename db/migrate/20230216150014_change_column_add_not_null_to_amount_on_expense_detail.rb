class ChangeColumnAddNotNullToAmountOnExpenseDetail < ActiveRecord::Migration[7.0]
  def change
    change_column_null :expense_details, :amount, false
  end
end
