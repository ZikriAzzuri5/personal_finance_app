class AddCategoryIdInTransactions < ActiveRecord::Migration[7.0]
  def change
    add_reference :transactions, :category, index: true, foreign_key: true, null: true
  end

  def data
    Transaction.where(category_id: nil).update_all(category_id: Category.first.id)
  end
end
