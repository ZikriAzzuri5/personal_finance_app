# == Schema Information
#
# Table name: currencies
#
#  id           :bigint           not null, primary key
#  code         :string           not null
#  country_code :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Currency < ApplicationRecord
  has_many :wallets
end
