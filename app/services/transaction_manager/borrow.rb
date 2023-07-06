class TransactionManager::Borrow < ServiceBase
  def call(transaction_params, id = nil)
    if id
      borrow = Transaction.find(id)
      borrow.assign_attributes(transaction_params)
    else
      borrow = Transaction.new(transaction_params)
    end

    borrow.amount = borrow.amount.to_i.abs
    borrow.transaction_type_id = TransactionType.borrow.id

    ActiveRecord::Base.transaction do
      borrow.save!

      if id
        borrow.sync_to_wallet!
      else
        borrow.add_to_wallet!
      end
    rescue ActiveRecord::RecordInvalid => invalid
      @result.errors = invalid.record.errors
    end

    @result.value = borrow

    return @result
  end
end
