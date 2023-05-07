class RemoveWalletAccountInTransactionsTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :wallet_account
  end
end
