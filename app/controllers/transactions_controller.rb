class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_category, only: [:show, :edit, :update, :destroy]

  def index
    @transactions = Transaction.all
  end

  def show
  end

  def new
    @transaction = Transaction.new

    render_based_on_transaction_type
  end

  def create
    result = TransactionManager::Expense.call(transaction_params)

    if result.errors.empty?
      redirect_to new_transaction_path
    else
      @transaction = result.value

      render_based_on_transaction_type status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @transaction.update(transaction_params)

    redirect_to transaction_path(@transaction)
  end

  def destroy
    @transaction.destroy

    redirect_to transactions_path
  end

  private

  def transaction_params
    params.require(:transaction).permit(
      :amount, :transaction_at, :description, :wallet_id, :category_id, :contact_id
    ).merge(user_id: current_user.id)
  end

  def current_transaction
    @transaction = Transaction.find(params[:id])
  end

  def current_wallet
    @wallet = Wallet.find(params[:id])
  end

  def render_based_on_transaction_type(options = {})
    transaction_type = TransactionType.find_by_id(params[:transaction_type_id])

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
