class CreateExpenseAndRules < ActiveRecord::Migration[7.0]
  def change
    create_table :expense_and_rules, id: :uuid do |t|
      t.references :expense, null: false, foreign_key: true, type: :uuid
      t.references :rule, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
