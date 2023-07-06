class TransactionManager::Transfer < ServiceBase
  def call(transaction_params, id = nil)
    if id
      transfer = Transaction.find(id)
      transfer.assign_attributes(transaction_params)
    else
      transfer = Transaction.new(transaction_params)
    end

    transfer.amount = transfer.amount.to_i.abs
    transfer.transaction_type_id = TransactionType.transfer.id
    transfer.category_id = nil

    ActiveRecord::Base.transaction do
      transfer.save!

      if id
        transfer.sync_to_wallet_for_transfer!
      else
        transfer.add_to_wallet_for_transfer!
      end

    rescue ActiveRecord::RecordInvalid => invalid
      @result.errors = invalid.record.errors
    end

    @result.value = transfer

    return @result
  end
end



# class TransactionManager::Transfer < ServiceBase
#   def call(transaction_params, id = nil)
#     if id
#       transfer = Transaction.find(id)
#       transfer.assign_attributes(transaction_params)
#     else
#       transfer = Transaction.new(transaction_params)
#     end

#     transfer.amount_in_decimal = transfer.amount_in_decimal.abs
#     transfer.transaction_type_id = TransactionType.find_by(name: 'Transfer').id
#     transfer.category_id = nil

#     ActiveRecord::Base.transaction do
#       transfer.save!

#       if id
#         transfer.sync_to_wallet_for_transfer!
#       else
#         transfer.sync_to_wallet_for_transfer! # Update source wallet and target wallet
#       end
#     rescue ActiveRecord::RecordInvalid => invalid
#       @result.errors = invalid.record.errors
#     end

#     @result.value = transfer

#     return @result
#   end
# end
