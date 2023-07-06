class TransactionTemplateManager::Adjustment < ServiceBase
  def call(transaction_template_params)
    adjustment = TransactionTemplate.new(transaction_template_params)
    adjustment.transaction_type_id = TransactionType.adjustment.id

    wallet = Wallet.find(adjustment.wallet_id)

    ActiveRecord::Base.transaction do
      if adjustment.amount <= wallet.amount
        adjustment.amount = adjustment.amount.to_i.abs
      elsif adjustment.amount > wallet.amount
        adjustment.amount = -adjustment.amount.to_i.abs
      end

      wallet.amount = adjustment.amount
      wallet.save!
      adjustment.save!
    rescue ActiveRecord::RecordInvalid => invalid
      @result.errors = invalid.record.errors
    end

    @result.value = adjustment

    return @result
  end
end
