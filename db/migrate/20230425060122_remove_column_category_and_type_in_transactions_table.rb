class RemoveColumnCategoryAndTypeInTransactionsTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :category
    remove_column :transactions, :type

  end
end
