require 'test_helper'

class PageTest < ActiveSupport::TestCase

  def setup
  	@page = Page.new(title: "Home", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sed molestie ipsum. Praesent euismod, lacus eu blandit commodo, eros augue imperdiet dui, ornare ornare purus lectus sit amet ex. In aliquam fermentum efficitur. Nulla varius lectus ac magna interdum gravida. Nullam erat eros, auctor at volutpat ac, commodo et sem. Maecenas mollis tincidunt tellus sed volutpat. Quisque nulla tellus, pellentesque in ultrices vitae, euismod nec libero. Sed et semper velit.", short_content_text: "Lorem Ipsum dolor sit amet...", 
  					 tags: "1, 2, 3, 4", description: "Info about ...")
  end

  test "presence of content" do
    @page.content = ' '
    assert_not @page.valid?
  end
  
  test "presence of title" do
    @page.title = ' '
    assert_not @page.valid?
  end

  test "minimum title length" do
    @page.title = 'aa'
    assert_not @page.valid?
  end
 test "title should be unique" do
    page_duplicate = @page.dup #@page.dup creates the same users as @page
    page_duplicate.title = @page.title
    @page.save
    assert_not page_duplicate.valid?
  end
end
