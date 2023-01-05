class CreateExpenseAndUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :expense_and_users, id: :uuid do |t|
      t.references :expense, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
