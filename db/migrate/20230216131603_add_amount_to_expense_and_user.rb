class AddAmountToExpenseAndUser < ActiveRecord::Migration[7.0]
  def change
    add_column :expense_and_users, :amount, :integer
  end
end
