class ProductsController < ApplicationController
  before_action :authenticate_user!,only: [:new]
  
  def index
    @products = Product.all.includes(:user)
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

private

  def product_params
    params.require(:product).permit(:title,:details,:category_id,:status_id,:delivery_charge_id,:area_id,:days_id,:price,:image).merge(user_id:current_user.id)
  end


end
