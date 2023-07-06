class AddColumnsRecurringInTransactionTemplate < ActiveRecord::Migration[7.0]
  def change
    add_column :transaction_templates, :recurring_type, :string
    add_column :transaction_templates, :recurring_step, :integer
    add_column :transaction_templates, :recurring_end_date, :date
    add_column :transaction_templates, :recurring_day_of_month, :integer, limit:2
  end
end
