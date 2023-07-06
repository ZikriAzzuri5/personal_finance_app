class TransactionTemplateManager::Expense < ServiceBase
  def call(transaction_template_params)
    expense = TransactionTemplate.new(transaction_template_params)
    expense.amount = -expense.amount.to_i.abs
    expense.transaction_type_id = TransactionType.expense.id

    ActiveRecord::Base.transaction do
      expense.save!
      expense.sync_to_wallet!
    rescue ActiveRecord::RecordInvalid => invalid
      @result.errors = invalid.record.errors
    end

    @result.value = expense

    return @result
  end
end
