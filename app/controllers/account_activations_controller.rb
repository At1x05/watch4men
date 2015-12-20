class AccountActivationsController < ApplicationController
  
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user 
      flash[:success] = "Twoje konto zostało aktywowane!"
      redirect_to user
    else
      flash[:danger] = "Ups, wygląda na to, że link aktywacyjny jest niepoprawny"
      redirect_to root_url
    end
  end
end