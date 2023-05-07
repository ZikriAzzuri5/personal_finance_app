class AddUserFieldToWalletTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :wallets, :user, index: true, foreign_key: true, null: true
  end

  def data
    Wallet.where(user_id: nil).update_all(user_id: User.first.id)
  end
end
