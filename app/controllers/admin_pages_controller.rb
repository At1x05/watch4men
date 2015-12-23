class AdminPagesController < ApplicationController
	before_action :admin_user
	
	def show
	end

	private

	  def admin_user
      redirect_to(root_url) unless current_user.try(:admin?)
    end
end
