class RenameColumnWalletCategoriesTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :wallets, :amount_of_money, :amount
  end
end
