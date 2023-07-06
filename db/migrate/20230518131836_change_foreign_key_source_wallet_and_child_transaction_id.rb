class ChangeForeignKeySourceWalletAndChildTransactionId < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :transactions, column: :source_wallet_id
    remove_foreign_key :transactions, column: :child_transaction_id

    add_foreign_key :transactions, :transactions, column: :child_transaction_id
    add_foreign_key :transactions, :wallets, column: :source_wallet_id
  end
end
