class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit]
  before_action :set,only:[:edit,:show]
  before_action :move_to_index,only:[:edit]

  def index
    @products = Product.all.includes(:user).order('created_at DESC')
  end

  def new
    @product = Product.new
    @product_errors = Product.new
  end

  def create
    product = Product.new(product_params)
    if product.save
      redirect_to root_path
    else
      @product_errors = product
      @product = Product.new
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      redirect_to product_path(product)
    else
      @product = Product.find(params[:id])
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :details, :category_id, :status_id, :delivery_charge_id, :area_id, :days_id, :price, :image).merge(user_id: current_user.id)
  end

  def set
    @product = Product.find(params[:id])
  end 

  def move_to_index
    unless user_signed_in? && current_user.id == @product.user_id
    redirect_to root_path
    end
  end
end
