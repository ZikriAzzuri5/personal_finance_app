class ChangeWalletTypeIdNullableInWallets < ActiveRecord::Migration[7.0]
  def change
    change_column_null :wallets, :wallet_type_id, false
  end
end
