class ChangeExpenseAndUserToExpenseDetail < ActiveRecord::Migration[7.0]
  def change
    rename_table :expense_and_users, :expense_details
  end
end
