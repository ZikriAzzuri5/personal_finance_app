class ChangeFkSourceWalletId < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :transaction_templates, :transaction_templates
    add_foreign_key :transaction_templates, :wallets, column: :source_wallet_id, primary_key: :id
  end
end
