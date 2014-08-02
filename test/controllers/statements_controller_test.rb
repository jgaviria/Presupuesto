require 'test_helper'

class StatementsControllerTest < ActionController::TestCase
  test "should get gas" do
    get :gas
    assert_response :success
  end

end
