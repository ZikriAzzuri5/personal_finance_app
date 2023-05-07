module TransactionTypesHelper
  def transaction_type_select_options
    TransactionType.all.order(id: :asc).map { |t| [t.name, t.id] }
  end
end
