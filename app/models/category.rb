# == Schema Information
#
# Table name: categories
#
#  id                  :bigint           not null, primary key
#  description         :string
#  name                :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  transaction_type_id :bigint           not null
#  user_id             :bigint           not null
#
# Indexes
#
#  index_categories_on_transaction_type_id  (transaction_type_id)
#  index_categories_on_user_id              (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (transaction_type_id => transaction_types.id)
#  fk_rails_...  (user_id => users.id)
#
class Category < ApplicationRecord
  has_many :transactions
  has_many :transaction_types

  belongs_to :user

  validates :name, presence: true

end
