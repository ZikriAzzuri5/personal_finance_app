class CreateTransactionTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_templates do |t|

      t.timestamps
    end
  end
end
