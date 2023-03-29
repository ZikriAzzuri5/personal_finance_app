class WalletCategory < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :amount_of_money, presence: true, numericality: { greater_than: 0 }
  validate :custom_name_validation

  def custom_name_validation

  end
end
