class ChangeCurrencyIdNullableInWallets < ActiveRecord::Migration[7.0]
  def change
    change_column_null :wallets, :currency_id, false
  end
end
