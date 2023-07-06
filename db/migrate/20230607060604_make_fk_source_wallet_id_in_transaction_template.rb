class MakeFkSourceWalletIdInTransactionTemplate < ActiveRecord::Migration[7.0]
  def change
      add_foreign_key :transaction_templates, :transaction_templates, column: :source_wallet_id
  end
end
