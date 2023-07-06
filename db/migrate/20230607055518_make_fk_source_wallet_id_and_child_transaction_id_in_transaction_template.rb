class MakeFkSourceWalletIdAndChildTransactionIdInTransactionTemplate < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :transaction_templates, :transaction_templates, column: :child_transaction_id
  end
end
