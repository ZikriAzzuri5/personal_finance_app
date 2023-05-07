class ChangeColumnNameDescriptionAndAmountNullableInWallets < ActiveRecord::Migration[7.0]
  def change
    change_column_null :wallets, :name, false
    change_column_null :wallets, :amount, false
    change_column_null :wallets, :description, false
  end
end
