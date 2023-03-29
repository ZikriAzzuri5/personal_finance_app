class WalletCategoriesController < ApplicationController
  before_action :current_wallet_category, only: [:show, :edit, :update, :destroy]

  def index
    @wallet_categories = WalletCategory.all
  end

  def show
  end

  def edit
  end

  def update
    @wallet_category.update(wallet_category_params)

    redirect_to wallet_categories_path(@wallet_category)
  end

  def new
    @wallet_category = WalletCategory.new
  end

  def create
    @wallet_category = WalletCategory.new(wallet_category_params)

    if @wallet_category.save
      redirect_to wallet_categories_path
    else
      render :new, status: 422
    end
  end


  def destroy
    @wallet_category.destroy

    redirect_to wallet_categories_path
  end

  private
  def wallet_category_params
    params.require(:wallet_category).permit(:name, :wallet_type, :amount_of_money, :description)
  end

  def current_wallet_category
    @wallet_category = WalletCategory.find(params[:id])
  end
end
