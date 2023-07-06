class MakeSourceWalletIdAndChildTransactionIdFk < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :transactions, :transactions, column: :child_transaction_id
    add_foreign_key :transactions, :transactions, column: :source_wallet_id
  end
end
