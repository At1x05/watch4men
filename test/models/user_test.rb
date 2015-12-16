require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
  	@user = User.new(name: "Mati Now", email: "user@matidea.pl", address: "Krańcowa 111/11b", 
  					 phone: "+48 512 322 433", city: "Poznań", password: "razdwatrzy", password_confirmation: "razdwatrzy" )
  end

  test "should be valid" do 
  	assert @user.valid?
  end
  	
  test "name should be present" do
  	@user.name = "  "
  	assert_not @user.valid?
  end

  test "name should be not too long" do
  	@user.name = "a" * 51
  	assert_not @user.valid?
  end

  test "name should be not too short" do
  	@user.name = "aa" 
  	assert_not @user.valid?
  end

  test "email should be present" do
  	@user.email = "  "
  	assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 250 + "@matidea.pl"
    assert_not @user.valid?
  end

  test "email validation whether valid naming" do
    valid_addresses = %w[user@matidea.pl USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email address should be unique" do
    user_duplicate = @user.dup #@user.dup creates the same users as @user
    user_duplicate.email = @user.email.upcase
    @user.save
    assert_not user_duplicate.valid?
  end

  test "phone should be present" do
  	@user.phone = "  "
  	assert_not @user.valid?
  end

   test "password should be present" do
    @user.password = @user.password_confirmation = " " * 10
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end



end
