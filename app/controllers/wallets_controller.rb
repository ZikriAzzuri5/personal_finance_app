class WalletsController < ApplicationController
  before_action :current_wallet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @q = Wallet.where(user_id: current_user).ransack(params[:q])
    @wallets = @q.result(distinct: true)
  end

  def show
  end

  def edit
  end

  def update
    @wallet.update(wallet_params)

    redirect_to wallets_path(@wallet)
  end

  def new
    @wallet = Wallet.new
  end

  def create
    @wallet = Wallet.new(wallet_params)

    if @wallet.save
      redirect_to wallets_path
    else
      render :new, status: 422
    end
  end

  def destroy
    @wallet.destroy

    redirect_to wallets_path
  end

  private
  def wallet_params
    params.require(:wallet).permit(
      :name, :wallet_type_id, :currency_id, :amount, :description
    ).merge(user_id: current_user.id)
  end

  def current_wallet
    @wallet = Wallet.find(params[:id])
  end
end
