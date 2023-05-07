class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :amount
      t.string :date
      t.string :description
      t.string :type
      t.string :wallet_account
      t.string :category

      t.timestamps
    end
  end
end
