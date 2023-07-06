class TransactionTemplateManager::Lend < ServiceBase
  def call(transaction_template_params)
    lend = TransactionTemplate.new(transaction_template_params)
    lend.amount = -lend.amount.to_i.abs
    lend.transaction_type_id = TransactionType.lend.id

    ActiveRecord::Base.transaction do
      lend.save!
      lend.sync_to_wallet!
    rescue ActiveRecord::RecordInvalid => invalid
      @result.errors = invalid.record.errors
    end
    @result.value = lend

    return @result
  end
end
