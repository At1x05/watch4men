class ApplicationController < ActionController::Base
  include SessionsHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  #session variable exists in every controller
  def initialize_cart
    @cart = Cart.build_from_hash(session)
  end
end
