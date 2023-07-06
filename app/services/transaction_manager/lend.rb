class TransactionManager::Lend < ServiceBase
  def call(transaction_params, id = nil)
    if id
      lend = Transaction.find(id)
      lend.assign_attributes(transaction_params)
    else
      lend = Transaction.new(transaction_params)
    end

    lend.amount = -lend.amount.to_i.abs
    lend.transaction_type_id = TransactionType.lend.id

    ActiveRecord::Base.transaction do
      lend.save!

      if id
        lend.sync_to_wallet!
      else
        lend.add_to_wallet!
      end
    rescue ActiveRecord::RecordInvalid => invalid
      @result.errors = invalid.record.errors
    end
    @result.value = lend

    return @result
  end
end
