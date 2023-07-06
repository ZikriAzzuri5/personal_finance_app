class TransactionTemplateManager::Income < ServiceBase
  def call(transaction_template_params)
    income = TransactionTemplate.new(transaction_template_params)
    income.amount = income.amount.to_i.abs
    income.transaction_type_id = TransactionType.income.id

    ActiveRecord::Base.transaction do
      income.save!
      income.sync_to_wallet!
    rescue ActiveRecord::RecordInvalid => invalid
      @result.errors = invalid.record.errors
    end

    @result.value = income

    return @result
  end
end
