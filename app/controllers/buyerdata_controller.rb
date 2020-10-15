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
    product = Product.find(params[:product_id])
    @buyer = Buyer.create(buyer_params)
    buyerdata = BuyerData.new(buyerdata_params)
    if buyerdata.save
      pay_product
      redirect_to root_path
    else
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
    Payjp.api_key = "sk_test_1edccd39b786e9de4db957d4" 
    Payjp::Charge.create(
      amount: product.price,
      card: buyerdata_params[:token],
      currency: 'jpy'
    )
  end

end