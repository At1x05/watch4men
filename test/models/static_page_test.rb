require 'test_helper'

class StaticPageTest < ActiveSupport::TestCase
  def setup
  	@static_page = StaticPage.new(header: "Header", sub_header: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sed molestie ipsum. Praesent euismod, lacus eu blandit commodo, eros augue imperdiet dui, ornare ornare purus lectus sit amet ex. In aliquam fermentum efficitur. Nulla varius lectus ac magna interdum gravida. Nullam erat eros, auctor at volutpat ac, commodo et sem. Maecenas mollis tincidunt tellus sed volutpat. Quisque nulla tellus, pellentesque in ultrices vitae, euismod nec libero. Sed et semper velit.", short_description: "Lorem Ipsum dolor sit amet...", 
  					 box_one: "1, 2, 3, 4", box_two: 'lorem upsum',  cto_button: "Info about ...")
  end
  
  test "require header" do
  	@static_page.header =' '
  	assert_not @static_page.valid?    	
  end

  test "require sub header" do
  	@static_page.sub_header =' '
  	assert_not @static_page.valid?    	
  end

  test "require description on the belt" do
  	@static_page.short_description =' '
  	assert_not @static_page.valid?    	
  end

  test "require box 1" do
  	@static_page.box_one =' '
  	assert_not @static_page.valid?    	
  end

  test "require box 2" do
  	@static_page.box_two =' '
  	assert_not @static_page.valid?    	
  end

  test "require button text" do
  	@static_page.cto_button =' '
  	assert_not @static_page.valid?    	
  end


end
