class ChangeDataTypeInTransactionTable < ActiveRecord::Migration[7.0]
  def change
    change_column(:transactions, :amount, :integer, using: 'amount::integer')
    change_column(:transactions, :date, :date, using:'date::date')
  end
end
