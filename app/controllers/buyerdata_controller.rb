class BuyerdataController < ApplicationController
  def index
    @buyer = Buyer.new
    @buyerdate = BuyerData.new
    @product = Product.find(params[:product_id])
    if !user_signed_in?
      redirect_to new_user_session_path
    elsif user_signed_in? && current_user.id == @product.user_id
      redirect_to controller: :products, action: :index
    end
  end

  def create
    @buyer = Buyer.create(buyer_params)
    buyerdata = BuyerData.new(buyerdata_params)
    if buyerdata.save
      redirect_to root_path
    else
      @buyerdate = BuyerData.new(buyerdata_params)
      @product = Product.find(params[:product_id])
      render :index
    end 
  end

  private

  def buyer_params
    params.permit(:product_id).merge(user_id:current_user.id)
  end

  def buyerdata_params
    params.permit(:postal_code,:prefecture_id,:city,:address,:building,:phone_number).merge(buyer_id:@buyer.id)
  end

end