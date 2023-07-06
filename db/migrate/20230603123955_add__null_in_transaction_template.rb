class AddNullInTransactionTemplate < ActiveRecord::Migration[7.0]
  def change
    change_column_null :transaction_templates, :category_id, true
  end
end
