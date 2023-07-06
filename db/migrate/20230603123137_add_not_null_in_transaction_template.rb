class AddNotNullInTransactionTemplate < ActiveRecord::Migration[7.0]
  def change
    change_column_null :transaction_templates, :wallet_id, false
    change_column_null :transaction_templates, :user_id, false
    change_column_null :transaction_templates, :category_id, false
    change_column_null :transaction_templates, :transaction_type_id, false
  end
end
