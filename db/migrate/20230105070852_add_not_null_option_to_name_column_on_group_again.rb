class AddNotNullOptionToNameColumnOnGroupAgain < ActiveRecord::Migration[7.0]
  def change
    # null: falseにする。nullを許容しない。
    change_column_null :groups, :name, false
  end
end
