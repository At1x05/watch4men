class StaticPagesController < ApplicationController
	before_action :admin_user, only:[:edit, :update, :index, :destroy, :add]

	def index
		@static_pages= StaticPage.all
		@static_page = StaticPage.find(1)
	end

	def show
		@static_page = StaticPage.find(1)
	end

	def new
	end

	def edit
		@static_page = StaticPage.find(1)
	end

	def create
	  	
	  @static_page = StaticPage.new(static_page_params)
	  @static_page.save
	  redirect_to @static_page
	end

	def update
	  @static_page = StaticPage.find(params[:id])

	  if @static_page.update(static_page_params)
	    redirect_to @static_page
	  else
		render 'edit'
	  end
	end

	#def destroy
	#	@static_page = StaticPage.find(params[:id])
	#	@static_page.destroy
	#	redirect_to root_url
	#end
	
	private

	  def static_page_params
        params.require(:static_page).permit(:header, :sub_header, :short_description, :box_one, :box_two, :cto_button)
      end

     def admin_user
      redirect_to(root_url) unless current_user.try(:admin?)
    end
end
