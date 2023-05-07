class ChangeWalletTypeColumnInWallets < ActiveRecord::Migration[7.0]
  def change
    remove_column :wallets, :wallet_type
    add_reference :wallets, :wallet_type, index: true, foreign_key: true, null: true
  end

  def data
    Wallet.where(wallet_type_id: nil).update_all(wallet_type_id: WalletType.first.id)
  end
end
