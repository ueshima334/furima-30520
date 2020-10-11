class ProductsController < ApplicationController
  def index
  end

  def new
    if user_signed_in?
    @product = Product.new
    @product_errors = Product.new
    else
    redirect_to new_user_session_path
    end

  end

  def create
    product = Product.new(product_params)
    if product.save
      redirect_to root_path
    else
      @product_errors = Product.new
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
