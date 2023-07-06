class MakeAmountNotNullInTransactionTemplate < ActiveRecord::Migration[7.0]
  def change
    change_column :transaction_templates, :amount, :integer, null: false
  end
end
