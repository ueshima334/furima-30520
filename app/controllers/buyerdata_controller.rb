class BuyerdataController < ApplicationController
  def index
    @buyer = Buyer.new
    @buyerdate = BuyerData.new
    @product = Product.find(params[:product_id])
    @product_errors = Product.new
    if !user_signed_in?
      redirect_to new_user_session_path
    elsif (user_signed_in? && current_user.id == @product.user_id) || Buyer.exists?(product_id:@product.id)
      redirect_to controller: :products, action: :index
    end
  end

  def create
    @product = Product.find(params[:product_id])
    @buyer = Buyer.create(buyer_params)
    buyerdata = BuyerData.new(buyerdata_params)
    if buyerdata.save
      pay_product
      redirect_to root_path
    else
      @product_errors = buyerdata
      @buyer.destroy
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
    params.permit(:postal_code,:prefecture_id,:city,:address,:building,:phone_number).merge(buyer_id:@buyer.id,token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: buyerdata_params[:token],
      currency: 'jpy'
    )
  end

end