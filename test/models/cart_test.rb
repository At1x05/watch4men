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
    cart= Cart.new
    product = Product.create! name: 'Apple Smartwatch', price: 2000, description: 'Lorem ipsum', long_description: 'lorem iiipsum', mark: 5
    cart.add_item product.id

    assert_kind_of Product, cart.items.first.find_product 
  end

  def test_serialize_with_hash
    cart = Cart.new
    cart.add_item 1

    assert_equal cart.serialize, hash_for_session["cart"]
  end

  def test_build_with_has
    cart = Cart.build_from_hash(hash_for_session)
    assert_equal 1, cart.items.first.product_id
  end

  private
    def hash_for_session
      {
        "cart" => {
          "items" => [
            {"product_id" => 1, "quantity" => 1}
          
          ]
        } 
      }
    end
end