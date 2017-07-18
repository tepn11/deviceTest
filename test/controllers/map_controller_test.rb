require 'test_helper'

class MapControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get map_view_url
    assert_response :success
  end

  test "should get share" do
    get map_share_url
    assert_response :success
  end

end
