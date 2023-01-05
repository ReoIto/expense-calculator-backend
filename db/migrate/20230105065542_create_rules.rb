class CreateRules < ActiveRecord::Migration[7.0]
  def change
    create_table :rules, id: :uuid do |t|
      t.integer :amount, null: false, default: 0
      t.boolean :is_discount_rule, null: false, default: false
      t.boolean :is_extra_charge_rule, null: false, default: false
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
