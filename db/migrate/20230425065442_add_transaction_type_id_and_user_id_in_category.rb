class AddTransactionTypeIdAndUserIdInCategory < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :user, index: true, foreign_key: true, null: true
    add_reference :categories, :transaction_type, index: true, foreign_key: true, null: true
  end

  def data
    Category.where(user_id: nil).update_all(user_id: User.first.id)
    Category.where(transaction_type_id: nil).update_all(transaction_type_id: TransactionType.first.id)
  end
end
