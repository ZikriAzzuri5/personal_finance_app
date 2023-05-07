class RenameDateInTransaction < ActiveRecord::Migration[7.0]
  def change
    rename_column :transactions, :date, :transaction_at
  end
end
