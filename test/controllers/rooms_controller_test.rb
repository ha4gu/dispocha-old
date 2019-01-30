require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "すてチャ(仮)"
  end

  # /new
  test "should get new" do
    get new_room_path
    assert_response :success
    assert_select "title", "ルーム作成 - #{@base_title}"
  end

end
