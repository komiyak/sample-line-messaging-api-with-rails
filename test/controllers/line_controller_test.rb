require 'test_helper'

class LineControllerTest < ActionDispatch::IntegrationTest
  test "should get send_message" do
    get line_send_message_url
    assert_response :success
  end
end
