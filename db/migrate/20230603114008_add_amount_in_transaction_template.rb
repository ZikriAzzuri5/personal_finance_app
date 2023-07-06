class AddAmountInTransactionTemplate < ActiveRecord::Migration[7.0]
  def change
    add_column :transaction_templates, :amount, :integer
  end
end
