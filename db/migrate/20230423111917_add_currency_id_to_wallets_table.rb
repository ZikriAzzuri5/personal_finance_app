class AddCurrencyIdToWalletsTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :wallets, :currency, index: true, foreign_key: true, null: true
  end
end
