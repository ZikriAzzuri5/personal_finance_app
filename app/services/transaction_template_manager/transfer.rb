class TransactionTemplateManager::Transfer < ServiceBase
  def call(transaction_template_params)
    transfer = TransactionTemplate.new(transaction_template_params)
    transfer.transaction_type_id = TransactionType.transfer.id
    transfer.amount = transfer.amount.to_i.abs
    transfer.category_id = nil

    ActiveRecord::Base.transaction do
      transfer.save!
      transfer.sync_to_wallet_for_transfer!
    rescue ActiveRecord::RecordInvalid => invalid
      @result.errors = invalid.record.errors
    end

    @result.value = transfer

    return @result
  end
end
