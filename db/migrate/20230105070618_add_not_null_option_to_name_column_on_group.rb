class AddNotNullOptionToNameColumnOnGroup < ActiveRecord::Migration[7.0]
  def change
    change_column_null :groups, :name, true
  end
end
