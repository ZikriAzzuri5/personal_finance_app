class TransactionManager::Income < ServiceBase
  def call(transaction_params)
    income = Transaction.new(transaction_params)
    income.transaction_type_id = TransactionType.income.id

    ActiveRecord::Base.transaction do
      income.save!
    rescue ActiveRecord::RecordInvalid => invalid
      @result.errors = invalid.record.errors
    end

    @result.value = income

    return @result
  end
end
