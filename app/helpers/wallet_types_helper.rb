module WalletTypesHelper
  def wallet_type_select_options
    WalletType.all.map { |wt| [wallet_type_name_translate(wt), wt.id] }
  end

  def wallet_type_name_translate(wallet_type)
    t(wallet_type.name.parameterize.underscore).titleize
  end
end
