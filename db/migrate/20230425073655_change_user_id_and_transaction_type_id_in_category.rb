class ChangeUserIdAndTransactionTypeIdInCategory < ActiveRecord::Migration[7.0]
  def change
    change_column_null :categories, :user_id, false
    change_column_null :categories, :transaction_type_id, false
  end
end
