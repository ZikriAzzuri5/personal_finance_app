module CurrenciesHelper
  def currency_select_options
    Currency.all.map { |c| [c.code, c.id] }
  end
end
