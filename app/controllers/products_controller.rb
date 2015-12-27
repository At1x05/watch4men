class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :happy_hours]
  before_action :initialize_cart
  before_action :admin_user, only: [:edit, :add, :update, :destroy, :new]

  
  def index
    @products = Product.all
  end


  def show
  end

 
  def new
    @product = Product.new
  end

  
  def edit
  end


  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Produkt został pomyślnie dodany.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Produkt został zaktualizowany' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Produkt został usunięty.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :image, :description, :mark, :long_description)
    end

    def admin_user
      redirect_to(root_url) unless current_user.try(:admin?)
    end

    def happy_hours
      t = Time.now.hour
      if t > 20 && t <24
        @product.price = @product.price * 0.8
      end
    end

    
end
