class CreateDealings < ActiveRecord::Migration[7.0]
  def change
    create_table :dealings, id: :uuid do |t|
      t.integer :status, null: false, default: 0
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :expense, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
