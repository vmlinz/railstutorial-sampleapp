require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  def setup
    @base_header = "Sample App"
  end
  
  test "should get home" do
    get :home
    assert_response :success
    assert_select "h1", "Home | #{@base_header}"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "h1", "Help | #{@base_header}"
  end
  
  test "should get about" do
    get :about
    assert_response :success
    assert_select "h1", "About | #{@base_header}"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "h1", "Contact | #{@base_header}"
  end
end
