class CreateWalletCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets do |t|
      t.string :name
      t.string :wallet_type
      t.integer :amount
      t.string :description

      t.timestamps
    end
  end
end
