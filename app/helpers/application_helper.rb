module ApplicationHelper
  def total_money
    Wallet.all.sum(&:amount)
  end
end
