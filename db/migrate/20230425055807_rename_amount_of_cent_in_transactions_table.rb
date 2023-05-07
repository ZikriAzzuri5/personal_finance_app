class RenameAmountOfCentInTransactionsTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :transactions, :amount_of_cent, :amount
  end
end
