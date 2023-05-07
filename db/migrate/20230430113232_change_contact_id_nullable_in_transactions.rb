class ChangeContactIdNullableInTransactions < ActiveRecord::Migration[7.0]
  def change
    change_column_null :transactions, :contact_id, false
  end
end
