class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :index]
  before_action :correct_user, only: [:show]
  before_action :admin_rights, only: [:destroy, :index]
  before_action :cuar, only: [:edit, :show]

  def index
    @users = User.all
  end

  def show
    @user= User.find(params[:id])    
  end

  def new
    @user= User.new
  end

  def edit
  	@user= User.find(params[:id])
  end
  
  def create
    @user= User.new(user_params)
      if @user.save
        @user.send_activation_email
        flash.now[:info] = "Sprawdź swoją skrzynkę E-mail w celu aktywacji Twojego konta."
        redirect_to root_url
      else
        render 'new'
      end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
      flash[:success]= "Twój profil został zaktualizowany"
  		redirect_to @user
  	else
  		render 'edit'
  	end
  end

  def destroy
    user_d= User.find(params[:id])
    user_d.destroy
    flash[:success] = 'Użytkownik został usunięty'
    redirect_to users_url
  end

  

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :address, :phone, :postal_code, :city)
    end

    def logged_in_user
      unless logged_in?
        flash.now[:danger]= "Proszę się zalogować"
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_rights
      redirect_to(root_url) unless current_user.try(:admin?)
    end

    def cuar
      if current_user.try(:admin?)
        admin_rights
      else
        correct_user
      end
    end

end