class TransactionTemplatesController < ApplicationController
  before_action :authenticate_user!
  before_action :current_transaction_template, only: [:show, :edit, :update, :destroy]

  def index
    @transaction_templates = TransactionTemplate.all
  end

  def show
    @transaction_template = TransactionTemplate.find(params[:id])
  end

  def new
    @transaction_template = TransactionTemplate.new(transaction_type_id: params[:transaction_type_id])
    @transaction_template.recurring_start_date = Time.current.to_date
    @transaction_template.recurring_end_date = Time.current.to_date

    render_based_on_transaction_type
  end

  def create
    @transaction_template = TransactionTemplate.new(transaction_template_params)
    @transaction_template.transaction_type_id = params[:transaction_type_id]

    if @transaction_template.save
      redirect_to transaction_templates_path
    else
      render_based_on_transaction_type status: :unprocessable_entity
    end
  end

  def edit
    @transaction_template = TransactionTemplate.find(params[:id])

    render_based_on_transaction_type
  end

  def update
    @transaction_template.update(transaction_template_params)

    redirect_to transaction_template_path(@transaction_template)
  end

  def destroy
    @transaction_template = TransactionTemplate.find_by(id: params[:id])

    @transaction_template.destroy

    redirect_to transaction_templates_path
  end

  private

  def transaction_template_params
    params.require(:transaction_template).permit(
      :amount, :description, :wallet_id, :category_id, :contact_name,
      :source_wallet_id, :recurring_end_date, :recurring_start_date,
      :recurring_step, :recurring_type, :transaction_type_id
    ).merge(user_id: current_user.id)
  end

  def current_transaction_template
    @transaction_template = TransactionTemplate.find(params[:id])
  end


  def render_based_on_transaction_type(options = {})
    transaction_type_id = @transaction_template.transaction_type_id
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
