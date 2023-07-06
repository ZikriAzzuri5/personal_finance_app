# == Schema Information
#
# Table name: transactions
#
#  id                   :bigint           not null, primary key
#  amount_in_decimal    :integer          not null
#  contact_name         :string
#  description          :string
#  transaction_at       :datetime         not null
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
#  index_transactions_on_category_id          (category_id)
#  index_transactions_on_transaction_type_id  (transaction_type_id)
#  index_transactions_on_user_id              (user_id)
#  index_transactions_on_wallet_id            (wallet_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (child_transaction_id => transactions.id)
#  fk_rails_...  (source_wallet_id => wallets.id)
#  fk_rails_...  (transaction_type_id => transaction_types.id)
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (wallet_id => wallets.id)
#
require "test_helper"

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
