class AddUserIdWalletIdAndTransactionTypeIdInTransactionsTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :transactions, :wallet, index: true, foreign_key: true, null: true
    add_reference :transactions, :user, index: true, foreign_key: true, null: true
    add_reference :transactions, :transaction_type, index: true, foreign_key: true, null: true
  end

  def data
    Transaction.where(wallet_id: nil).update_all(wallet_id: Wallet.first.id)
    Transaction.where(user_id: nil).update_all(user_id: User.first.id)
    Transaction.where(transaction_type_id: nil).update_all(transaction_type_id: TransactionType.first.id)
  end
end
