class AddContactIdToTableTransactions < ActiveRecord::Migration[7.0]
  def change
    add_reference :transactions, :contact, index: true, foreign_key: true, null: true
  end

  def data
    Transaction.where(contact_id: nil).update_all(contact_id: Contact.first.id)
  end
end
