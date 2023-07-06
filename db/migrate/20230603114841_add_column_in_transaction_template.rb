class AddColumnInTransactionTemplate < ActiveRecord::Migration[7.0]
  def change
    add_column :transaction_templates, :description, :string
  end
end
