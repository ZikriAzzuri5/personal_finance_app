class ChangeNullableColumnsInVariousTable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :email, false
    change_column_null :users, :password_digest, false
    change_column_null :categories, :name, false
    change_column_null :transaction_types, :name, false
    change_column_null :wallets, :description, true
  end
end
