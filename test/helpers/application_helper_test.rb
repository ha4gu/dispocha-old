require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

  test "build title helper" do
    assert_equal build_title, "すてチャ(仮)"
    assert_equal build_title(""), "すてチャ(仮)"
    assert_equal build_title("Test"), "Test - すてチャ(仮)"
  end

end
