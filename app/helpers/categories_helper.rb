module CategoriesHelper
  def category_select_options(user_id, transaction_type_id = nil)
    transaction_type_id = TransactionType.find_by_name('Expense').id if transaction_type_id.blank?
    Category.where(user_id: user_id, transaction_type_id: transaction_type_id).map { |c| [(c.name), c.id] }
  end
end
