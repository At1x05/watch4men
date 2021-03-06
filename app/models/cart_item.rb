class CartItem
  attr_reader :product_id, :quantity

  def initialize product_id, quantity = 1
  	@product_id = product_id
  	@quantity = quantity
  end

  def increment
  	@quantity = @quantity +1
  end

  def find_product
  	Product.find product_id
  end

  def total_price
  	find_product.price*quantity
  end

end