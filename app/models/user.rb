# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           not null
#  password_digest        :string           not null
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  validates :email, presence: true

  has_many :transactions
  has_many :transaction_templates
  has_many :wallets
  has_many :categories

  after_create :create_initial_categories!

  has_secure_password

  class << self
    def with_reset_password_token(token)
      where.not(reset_password_sent_at: nil).find_by(reset_password_token: token.to_s)
    end
  end

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

  def generate_password_token!
    update_columns(
      reset_password_token: SecureRandom.hex(10),
      reset_password_sent_at: Time.now.utc
    )
  end

  def password_token_expired?
    (self.reset_password_sent_at + 4.hours) < Time.now.utc
  end

  def clear_password_token!
    update_columns(
      reset_password_token: nil,
      reset_password_sent_at: nil
    )
  end
end
