# == Schema Information
#
# Table name: transaction_types
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TransactionType < ApplicationRecord
  has_many :categories

  class << self
    def expense
      @expense ||= find_by_name!('Expense')
    end
    def income
      @income ||= find_by_name!('Income')
    end
  end
end
