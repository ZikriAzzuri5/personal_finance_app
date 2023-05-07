module WalletsHelper
  def wallet_select_options
    Wallet.all.map { |w| [w.name, w.id] }
  end
end
