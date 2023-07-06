class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_transaction, only: [:show, :edit, :update, :destroy]

  def index
    @transactions = Transaction.all

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'transaction',
               template: 'transactions/transaction',
               formats: [:html]
      end
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new(transaction_type_id: params[:transaction_type_id])
    @transaction.transaction_at = Time.current

    render_based_on_transaction_type
  end

  def update
    result = transaction_service_klass.call(transaction_params, params[:id])

    if result.errors.blank?
      redirect_to transactions_path
    else
      @transaction = result.value

      render_based_on_transaction_type status: :unprocessable_entity
    end
  end


  def create
    result = transaction_service_klass.call(transaction_params)

    if result.errors.blank?
      redirect_to new_transaction_path
    else
      @transaction = result.value

      render_based_on_transaction_type status: :unprocessable_entity
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])

    render_based_on_transaction_type
  end


  def destroy
    @transaction = Transaction.find_by(id: params[:id])

    @transaction.destroy

    redirect_to transactions_path
  end

  def chart
    @transactions_by_category = Transaction.joins(:transaction_type)
    .where(transaction_types: { name: ['Income', 'Expense'] })
    .group('transaction_types.name')
    .sum(:amount_in_decimal)
  end




  # def chart
  #   @income_transactions = Transaction.where(transaction_type: TransactionType.find_by(name: 'Income')).
  #     group_by_month(:transaction_at).sum(:amount_in_decimal).transform_keys { |month| month.strftime("%B") }

  #   @expense_transactions = Transaction.where(transaction_type: TransactionType.find_by(name: 'Expense')).
  #     group_by_month(:transaction_at).sum(:amount_in_decimal).transform_keys { |month| month.strftime("%B") }
  # end

  private

  def transaction_params
    params.require(:transaction).permit(
      :amount, :transaction_at, :description, :wallet_id, :category_id, :contact_name,
      :source_wallet_id, :transaction_type_id
    ).merge(user_id: current_user.id)
  end

  def current_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_service_klass
    transaction_type = TransactionType.find_by_id(params[:transaction_type_id])
    case transaction_type&.name
    when 'Income'
      TransactionManager::Income
    when 'Borrow'
      TransactionManager::Borrow
    when 'Adjustment'
      TransactionManager::Adjustment
    when 'Transfer'
      TransactionManager::Transfer
    when 'Lend'
      TransactionManager::Lend
    else
      TransactionManager::Expense
    end
  end

  def render_based_on_transaction_type(options = {})
    transaction_type_id = @transaction.transaction_type_id
    transaction_type = TransactionType.find_by_id(transaction_type_id)

    template_name =
      case transaction_type&.name
      when 'Expense'
        :expense
      when 'Income'
        :income
      when 'Borrow'
        :borrow
      when 'Adjustment'
        :adjustment
      when 'Transfer'
        :transfer
      when 'Lend'
        :lend
      else
        :expense
      end

    render template_name, **options
  end
end
