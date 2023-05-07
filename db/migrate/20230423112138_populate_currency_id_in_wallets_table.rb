class PopulateCurrencyIdInWalletsTable < ActiveRecord::Migration[7.0]
  def data
    Wallet.where(currency_id: nil).update_all(currency_id: Currency.first.id)
  end
end
