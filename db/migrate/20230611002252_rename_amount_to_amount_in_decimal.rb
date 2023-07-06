class RenameAmountToAmountInDecimal < ActiveRecord::Migration[7.0]
  def change
    rename_column :transactions, :amount, :amount_in_decimal
    rename_column :transaction_templates, :amount, :amount_in_decimal
    rename_column :wallets, :amount, :amount_in_decimal
  end
end
