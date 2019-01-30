require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "すてチャ(仮)"
  end

  # トップページ
  test "should get root" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

end
