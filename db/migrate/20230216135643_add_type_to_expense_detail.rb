class AddTypeToExpenseDetail < ActiveRecord::Migration[7.0]
  def change
    add_column :expense_details, :type, :string
  end
end
