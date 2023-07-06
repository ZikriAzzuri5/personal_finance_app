# == Schema Information
#
# Table name: transaction_templates
#
#  id                   :bigint           not null, primary key
#  amount_in_decimal    :integer          not null
#  contact_name         :string
#  description          :string
#  recurring_end_date   :date
#  recurring_start_date :date
#  recurring_step       :integer
#  recurring_type       :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  category_id          :bigint
#  child_transaction_id :integer
#  source_wallet_id     :integer
#  transaction_type_id  :bigint           not null
#  user_id              :bigint           not null
#  wallet_id            :bigint           not null
#
# Indexes
#
#  index_transaction_templates_on_category_id          (category_id)
#  index_transaction_templates_on_transaction_type_id  (transaction_type_id)
#  index_transaction_templates_on_user_id              (user_id)
#  index_transaction_templates_on_wallet_id            (wallet_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (child_transaction_id => transaction_templates.id)
#  fk_rails_...  (source_wallet_id => wallets.id)
#  fk_rails_...  (transaction_type_id => transaction_types.id)
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (wallet_id => wallets.id)
#
class TransactionTemplate < ApplicationRecord
  SCHEDULE_TYPE_LIST = %w[1-time daily weekly monthly yearly].freeze

  belongs_to :user
  belongs_to :wallet
  belongs_to :source_wallet, class_name: 'Wallet', optional: true
  belongs_to :transaction_type
  belongs_to :category, optional: true
  belongs_to :contact, optional: true

  validates :amount, presence: true, numericality: {greater_than: 0}
  validate :validate_transfer_amount

  def amount=(value)
    write_attribute(:amount_in_decimal, value.to_f * 100)
  end

  def amount
    (read_attribute(:amount_in_decimal).to_f / 100.0).abs
  end

  def sync_to_wallet!
    wallet.amount_in_decimal += amount_in_decimal
    wallet.save!
  end

  def sync_to_wallet_for_transfer!
    source_wallet.amount_in_decimal -= amount_in_decimal
    wallet.amount_in_decimal += amount_in_decimal

    source_wallet.save!
    wallet.save!
  end

  def validate_transfer_amount
    if transaction_type_id == TransactionType.transfer.id
     if amount > wallet.amount
        errors.add(:amount, 'Transfer amount exceeds wallet balance')
      end
    end
  end
end
