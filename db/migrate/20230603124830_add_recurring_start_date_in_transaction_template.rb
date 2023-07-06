class AddRecurringStartDateInTransactionTemplate < ActiveRecord::Migration[7.0]
  def change
    add_column :transaction_templates, :recurring_start_date, :date
  end
end
