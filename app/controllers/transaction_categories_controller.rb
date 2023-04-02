class TransactionCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :current_transaction_category, only: [:show, :edit, :update, :destroy]

  def index
    @transaction_categories = TransactionCategory.all
  end

  def show
  end

  def edit
  end

  def update
    @transaction_category.update(transaction_category_params)

    redirect_to transaction_categories_path(@transaction_category)
  end

  def new
    @transaction_category = TransactionCategory.all
  end


  def create
    @transaction_category = TransactionCategory.create(transaction_category_params)

    if @transaction_category.save
      redirect_to transaction_categories_path
    else
      render :new, status: 422
    end
  end

  def destroy
    @transaction_category.destroy

    redirect_to transaction_categories_path
  end

  private
  def transaction_category_params
    params.require(:transaction_category).permit(:name, :description)
  end

  def current_transaction_category
    @transaction_category = TransactionCategory.find(params[:id])
  end
end
