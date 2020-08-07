require 'test_helper'

class Form1ControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get form1_new_url
    assert_response :success
  end

end
