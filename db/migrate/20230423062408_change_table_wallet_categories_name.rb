class ChangeTableWalletCategoriesName < ActiveRecord::Migration[7.0]
  def change
    rename_table :wallet_categories, :wallets
  end
end
