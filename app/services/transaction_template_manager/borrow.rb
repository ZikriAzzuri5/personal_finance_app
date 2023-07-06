class TransactionTemplateManager::Borrow < ServiceBase
  def call(transaction_template_params)
    borrow = TransactionTemplate.new(transaction_template_params)
    borrow.amount = borrow.amount.to_i.abs
    borrow.transaction_type_id = TransactionType.borrow.id

    ActiveRecord::Base.transaction do
      borrow.save!
      borrow.sync_to_wallet!
    rescue ActiveRecord::RecordInvalid => invalid
      @result.errors = invalid.record.errors
    end

    @result.value = borrow

    return @result
  end
end
