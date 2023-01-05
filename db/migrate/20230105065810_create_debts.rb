class CreateDebts < ActiveRecord::Migration[7.0]
  def change
    create_table :debts, id: :uuid do |t|
      t.integer :amount, null: false, default: 0
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
