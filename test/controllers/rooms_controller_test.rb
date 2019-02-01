require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "すてチャ(仮)"
    @room1 = rooms(:one)
  end


  # new
  test "should get new" do
    get new_room_path
    assert_response :success
    assert_template 'rooms/new'
    assert_select "title", "ルーム作成 - #{@base_title}"
    assert_not assigns(:room).code.nil?
  end


  # create

  test "should fail to save room" do
    # validationに引っかかってルーム作成に失敗するパターン
    assert_no_difference 'Room.count' do
      post create_room_path, params: { room: { code: "    ", name: "    " } }
    end
    assert_not flash.empty?
    assert_template 'rooms/new'
  end

  test "should succeed to save room" do
    # validationをクリアしてルーム作成に成功するパターン
    assert_difference 'Room.count', 1 do
      post create_room_path, params: { room: {
        code: "nWE910-amElAz_5", name: "👆Yet Another Test Room, Yeah!" } }
    end
    assert_not flash.empty?
    assert_redirected_to room_path(assigns(:room).code)
  end


  # show

  test "should be redirected when accessed non-exist room" do
    # 存在しないルームにアクセスしてリダイレクトされるパターン
    get room_path("non-exist_room")
    assert_not flash.empty?
    assert_redirected_to root_path
  end

  test "should be able to access room page" do
    # 存在しているルームにアクセスするパターン
    get room_path(@room1.code)
    assert_response :success
    assert_template 'rooms/show'
  end

end
