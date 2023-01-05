class CreateDebtAndUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :debt_and_users, id: :uuid do |t|
      t.references :debt, null: false, foreign_key: true, type: :uuid
      t.references :from_user, null: false, foreign_key: { to_table: :users }, type: :uuid
      t.references :to_user, null: false, foreign_key: { to_table: :users }, type: :uuid

      t.timestamps
    end
  end
end
