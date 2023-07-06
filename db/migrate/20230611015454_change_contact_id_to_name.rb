class ChangeContactIdToName < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :contact_id
    remove_column :transaction_templates, :contact_id
  end
end
