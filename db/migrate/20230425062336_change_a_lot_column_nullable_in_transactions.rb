class ChangeALotColumnNullableInTransactions < ActiveRecord::Migration[7.0]
  def change
    change_column_null :transactions, :amount, false
    change_column_null :transactions, :transaction_at, false
    change_column_null :transactions, :transaction_type_id, false
    change_column_null :transactions, :user_id, false
    change_column_null :transactions, :wallet_id, false
  end
end
