class ChangeDataTypeDateToDateTimeInTransactionsTable < ActiveRecord::Migration[7.0]
  def change
    change_column :transactions, :date, :datetime
  end
end
