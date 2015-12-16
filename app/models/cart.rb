class Cart
  attr_reader :items

  def initialize items = []
    @items = items
  end

  def add_item product_id
    item = @items.find { |item| item.product_id == product_id }
    if item
      item.increment
    else
      @items << CartItem.new(product_id)
    end
  end


  def empty?
    @items.empty?
  end

  def count
    @items.length
  end



  
end