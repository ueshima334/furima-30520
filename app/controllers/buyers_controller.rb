class BuyersController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
    if !user_signed_in?
      redirect_to new_user_session_path
    elsif user_signed_in? && current_user.id == @product.user_id
      redirect_to controller: :products, action: :index
    end
  end

end
