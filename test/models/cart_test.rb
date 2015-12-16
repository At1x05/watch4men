require "test_helper"

class CartTest < MiniTest::Test
  def test_add_one_item
    cart = Cart.new
    cart.add_item 1

    assert_equal cart.empty?, false
  end

  def test_add_more_quantities
    cart = Cart.new
    3.times { cart.add_item 1 }

    assert_equal 1, cart.items.length
    assert_equal 3, cart.items.first.quantity
  end

  def test_retrieve_products
    product = Product.create! name: 'Apple Smartwatch', price: 2000, description: 'Lorem ipsum'
    cart = Cart.new
    cart.add_item product.id

    assert_kind_of Product, cart.items.first.find_product 
  end
end