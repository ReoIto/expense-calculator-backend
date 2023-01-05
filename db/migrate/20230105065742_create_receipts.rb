class CreateReceipts < ActiveRecord::Migration[7.0]
  def change
    create_table :receipts, id: :uuid do |t|
      t.string :image_path
      t.references :expense, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
