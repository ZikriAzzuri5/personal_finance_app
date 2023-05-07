class ChangeCategoryNullableInTransactions < ActiveRecord::Migration[7.0]
  def change
    change_column_null :transactions, :category_id, false
  end
end
