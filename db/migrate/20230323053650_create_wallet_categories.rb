class CreateWalletCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :wallet_categories do |t|
      t.string :name
      t.string :wallet_type
      t.integer :amount_of_money
      t.string :description

      t.timestamps
    end
  end
end
