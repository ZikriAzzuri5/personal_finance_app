class TransactionManager::Expense < ServiceBase
  def call(transaction_params, id = nil)
    if id
      expense = Transaction.find(id)
      expense.assign_attributes(transaction_params)
    else
      expense = Transaction.new(transaction_params)
    end

    expense.amount = -expense.amount.to_i.abs
    expense.transaction_type_id = TransactionType.expense.id

    ActiveRecord::Base.transaction do
      expense.save!

      if id
        expense.sync_to_wallet!
      else
        expense.add_to_wallet!
      end
    rescue ActiveRecord::RecordInvalid => invalid
      @result.errors = invalid.record.errors
    end

    @result.value = expense

    return @result
  end
end
