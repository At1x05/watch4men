class CartsController < ApplicationController
  before_action :initialize_cart
  def add
  	@cart.add_item(params[:id])
  	session["cart"] =  @cart.serialize #we use session["cart"] to avoid overwriting of session in case we have other variables in session
  	product = Product.find(params[:id]) 
  	redirect_to :back, notice: "#{product.name.capitalize} został poprawnie dodany do koszyka"
  end

  def show
  end
end