class SourceWalletIdAndRelatedTransactionId < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :source_wallet_id, :integer, foreign_key: { to_table: :transactions}
    add_column :transactions, :child_transaction_id, :integer, foreign_key: { to_table: :transactions}
  end
end
