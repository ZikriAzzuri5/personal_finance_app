# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, presence: true

  has_many :transactions
  has_many :wallets
  has_many :categories

  after_create :create_initial_categories!

  has_secure_password

  def create_initial_categories!
    transaction_type_id = TransactionType.find_by_name('Expense').id
    category_names = [
      'Food', 'Child Stuff', 'Necessity', 'Transportation', 'Clothes', 'Donation', 'Health',
      'House', 'Entertainment', 'Personal Stuff', 'Pet Stuff', 'Bank'
    ]

    category_names.each do |name|
      categories.where(name: name, transaction_type_id: transaction_type_id).first_or_create!
    end

    transaction_type_id = TransactionType.find_by_name('Income').id
    category_names = [
      'Salary', 'Bonus', 'Bank Interest', 'Others'
    ]

    category_names.each do |name|
      categories.where(name: name, transaction_type_id: transaction_type_id).first_or_create!
    end

    transaction_type_id = TransactionType.find_by_name('Loan').id
    category_names = [
      'Borrowing', 'Debt Collecting', 'Repayment'
    ]

    category_names.each do |name|
      categories.where(name: name, transaction_type_id: transaction_type_id).first_or_create!
    end

    transaction_type_id = TransactionType.find_by_name('Borrow').id
    category_names = [
      'Borrowing', 'Debt Collecting', 'Repayment'
    ]

    category_names.each do |name|
      categories.where(name: name, transaction_type_id: transaction_type_id).first_or_create!
    end

    transaction_type_id = TransactionType.find_by_name('Lend').id
    category_names = [
      'Borrowing', 'Debt Collecting', 'Repayment'
    ]

    category_names.each do |name|
      categories.where(name: name, transaction_type_id: transaction_type_id).first_or_create!
    end
  end
end
