require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "h1", "Home | Sample App"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "h1", "Help | Sample App"
  end
  
  test "should get about" do
    get :about
    assert_response :success
    assert_select "h1", "About | Sample App"
  end

end
