class BuyerdataController < ApplicationController
  def index
    @buyerdate = BuyerData.new
    @product = Product.find(params[:product_id])
    if !user_signed_in?
      redirect_to new_user_session_path
    elsif user_signed_in? && current_user.id == @product.user_id
      redirect_to controller: :products, action: :index
    end
  end

  def create
    buyerdata = BuyerData.new(buyerdata_params)
    if buyerdata.save
      redirect_to root_path
    else
      @buyerdate = BuyerData.new
      @product = Product.find(params[:product_id])
      render :index
    end 
  end

  private

  def buyerdata_params
    params.permit(:postal_code,:prefecture_id,:city,:address,:building,:phone_number).merge(buyer_id:current_user.id)

  end
end