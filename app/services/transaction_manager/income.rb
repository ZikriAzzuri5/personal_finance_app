class TransactionManager::Income < ServiceBase
  def call(transaction_params, id = nil)
    if id
      income = Transaction.find(id)
      income.assign_attributes(transaction_params)
    else
      income = Transaction.new(transaction_params)
    end

    income.amount = income.amount.to_i.abs
    income.transaction_type_id = TransactionType.income.id

    ActiveRecord::Base.transaction do
      if income.valid?
        income.save!

        if id
          income.sync_to_wallet!
        else
          income.add_to_wallet!
        end
      else
        raise ActiveRecord::RecordInvalid, income
      end
    end

    @result.value = income

    return @result
  rescue ActiveRecord::RecordInvalid => invalid
    @result.errors = invalid.record.errors
  end
end
