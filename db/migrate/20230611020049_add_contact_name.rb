class AddContactName < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :contact_name, :string
    add_column :transaction_templates, :contact_name, :string
  end
end
