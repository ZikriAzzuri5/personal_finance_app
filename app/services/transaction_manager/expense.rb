class TransactionManager::Expense < ServiceBase
  def call(transaction_params)
    expense = Transaction.new(transaction_params)
    expense.transaction_type_id = TransactionType.expense.id

    ActiveRecord::Base.transaction do
      expense.save!
    rescue ActiveRecord::RecordInvalid => invalid
      @result.errors = invalid.record.errors
    end

    @result.value = expense

    return @result
  end
end
