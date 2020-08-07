require 'test_helper'

class Form2ControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get form2_new_url
    assert_response :success
  end

end
