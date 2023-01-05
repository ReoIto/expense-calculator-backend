class CreatePaymentMethods < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_methods, id: :uuid do |t|
      t.string :name
      t.references :expense, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
