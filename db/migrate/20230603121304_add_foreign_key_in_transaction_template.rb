class AddForeignKeyInTransactionTemplate < ActiveRecord::Migration[7.0]
  def change
    add_reference :transaction_templates, :contact, index: true, foreign_key: true, null: true
    add_reference :transaction_templates, :category, index: true, foreign_key: true, null: true
    add_reference :transaction_templates, :transaction_type, index: true, foreign_key: true, null: true
    add_reference :transaction_templates, :user, index: true, foreign_key: true, null: true
    add_reference :transaction_templates, :wallet, index: true, foreign_key: true, null: true
  end

  def data
    TransactionTemplate.where(contact_id: nil).update_all(contact_id: Contact.first.id)
    TransactionTemplate.where(category_id: nil).update_all(category_id: Category.first.id)
    TransactionTemplate.where(transaction_type_id: nil).update_all(transaction_type_id: TransactionType.first.id)
    TransactionTemplate.where(user_id: nil).update_all(user_id: User.first.id)
    TransactionTemplate.where(wallet_id: nil).update_all(wallet_id: Wallet.first.id)
  end
end
