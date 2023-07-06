module WalletsHelper
  def wallet_select_options
    Wallet.where(user_id: current_user.id).map { |w| [w.name, w.id] }
  end

  def current_user_wallet
    @current_user_wallet = Wallet.where(user_id: current_user)
  end

  def current_total_balance
    @current_total_balance = current_user_wallet.all.sum(&:amount)
  end
end
