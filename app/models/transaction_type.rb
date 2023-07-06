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
    def borrow
      @borrow ||= find_by_name!('Borrow')
    end
    def lend
      @lend ||= find_by_name!('Lend')
    end
    def transfer
      @transfer ||= find_by_name!('Transfer')
    end
    def adjustment
      @adjustment ||= find_by_name!('Adjustment')
    end
  end
end
