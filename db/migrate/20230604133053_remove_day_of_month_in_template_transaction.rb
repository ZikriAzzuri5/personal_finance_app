class RemoveDayOfMonthInTemplateTransaction < ActiveRecord::Migration[7.0]
  def change
    remove_column :transaction_templates, :recurring_day_of_month
  end
end
