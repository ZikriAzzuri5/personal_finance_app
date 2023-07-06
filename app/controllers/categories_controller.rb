class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :current_category, only: [:show, :edit, :update, :destroy]

  def index
    @q = Category.where(user_id: current_user).ransack(params[:q])
    @categories = @q.result(distinct: true)

    if params[:back_button].present?
      redirect_to categories_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @category.update(category_params)

    redirect_to categories_path(@category)
  end

  def new
    @category = Category.new
  end


  def create
    @category = Category.create(category_params)

    if @category.save
      redirect_to categories_path
    else
      render :new, status: 422
    end
  end

  def destroy
    @category.destroy

    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name, :description)
  end

  def current_category
    @category = Category.find(params[:id])
  end
end
