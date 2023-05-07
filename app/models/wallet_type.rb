# == Schema Information
#
# Table name: wallet_types
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class WalletType < ApplicationRecord
  has_many :wallets
end
