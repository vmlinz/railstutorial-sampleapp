require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @base_header = "Sample App"
  end
  
  test "should get new" do
    get :new
    assert_response :success
    assert_select "h1", "Sign up | #{@base_header}"
  end

end
