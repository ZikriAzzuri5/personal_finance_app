# == Schema Information
#
# Table name: wallets
#
#  id             :bigint           not null, primary key
#  amount         :integer          not null
#  description    :string
#  name           :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  currency_id    :bigint           not null
#  user_id        :bigint           not null
#  wallet_type_id :bigint           not null
#
# Indexes
#
#  index_wallets_on_currency_id     (currency_id)
#  index_wallets_on_user_id         (user_id)
#  index_wallets_on_wallet_type_id  (wallet_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (currency_id => currencies.id)
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (wallet_type_id => wallet_types.id)
#
class Wallet < ApplicationRecord
  belongs_to :user
  belongs_to :wallet_type
  belongs_to :currency

  has_many :transactions

  validates :name, presence: true, length: { minimum: 3 }
  validates :amount, presence: true, numericality: { greater_than_or_eq: 0 }

  def amount=(value)
    write_attribute(:amount, value.to_f * 100)
  end

  def amount
    read_attribute(:amount).to_f / 100.0
  end
end
