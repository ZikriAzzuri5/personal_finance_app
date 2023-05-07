# == Schema Information
#
# Table name: transactions
#
#  id                  :bigint           not null, primary key
#  amount              :integer          not null
#  description         :string
#  transaction_at      :datetime         not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  category_id         :bigint           not null
#  contact_id          :bigint           not null
#  transaction_type_id :bigint           not null
#  user_id             :bigint           not null
#  wallet_id           :bigint           not null
#
# Indexes
#
#  index_transactions_on_category_id          (category_id)
#  index_transactions_on_contact_id           (contact_id)
#  index_transactions_on_transaction_type_id  (transaction_type_id)
#  index_transactions_on_user_id              (user_id)
#  index_transactions_on_wallet_id            (wallet_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (contact_id => contacts.id)
#  fk_rails_...  (transaction_type_id => transaction_types.id)
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (wallet_id => wallets.id)
#
class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :wallet
  belongs_to :transaction_type
  belongs_to :category
  belongs_to :contact, optional: true

  validates :amount, presence: true, numericality: true

  def amount=(value)
    write_attribute(:amount, value.to_f * 100)
  end

  def amount
    read_attribute(:amount).to_f / 100.0
  end
end

# name   | currency | amount
# Paypal | USD      | 2.40

# 13000 / 13500
# 10000 / 14000
# 10000 / 13700

# amount    | currency | conversion_rate    | base_currency
# 1300000  | IDR      | 13500.00             | USD
# 1000000  | IDR      | 14000.00             | USD
# 1000000 | IDR      | 13700.00             | USD

# Transaction
