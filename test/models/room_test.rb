require 'test_helper'

class RoomTest < ActiveSupport::TestCase

  def setup
    @room = Room.new(
      code: "Vk3e-6xudmo_FSi3jL",
      name: "Example Room",
    )
    @MIN_CODE_LENGTH = 8
    @MAX_CODE_LENGTH = 255
    @MAX_NAME_LENGTH = 255
  end

  test "should be valid" do
    assert @room.valid?
  end

  test "code should be present" do
    @room.code = "    "
    assert_not @room.valid?
  end

  test "code should be unique" do
    @room.code = "MyTestRoom1" # already in fixtures
    assert_not @room.valid?
  end

  test "code should be in appropriate length" do
    @room.code = "a"*(@MIN_CODE_LENGTH - 1)
    assert_not @room.valid?
    @room.code = "a"*@MIN_CODE_LENGTH
    assert @room.valid?
    @room.code = "a"*@MAX_CODE_LENGTH
    assert @room.valid?
    @room.code = "a"*(@MAX_CODE_LENGTH + 1)
    assert_not @room.valid?
  end

  test "code should use only alphabet, numer, _, and -" do
    assert @room.valid?
    @room.code = "AbCdEfGhIjK"
    assert @room.valid?
    @room.code = "0123456789"
    assert @room.valid?
    @room.code = "----------"
    assert @room.valid?
    @room.code = "__________"
    assert @room.valid?
    @room.code = "A-Cd_f h1jK" # can't use space
    assert_not @room.valid?
    @room.code = "A-Cd_f@h1jK" # can't use @
    assert_not @room.valid?
    @room.code = "A-Cd_f=h1jK" # can't use =
    assert_not @room.valid?
    @room.code = "A-Cd_f#h1jK" # can't use #
    assert_not @room.valid?
    @room.code = "A-Cd_f/h1jK" # can't use /
    assert_not @room.valid?
    @room.code = "A-Cd_f?h1jK" # can't use ?
    assert_not @room.valid?
    @room.code = "A-Cd_f+h1jK" # can't use +
    assert_not @room.valid?
    @room.code = "A-Cd_f!h1jK" # can't use !
    assert_not @room.valid?
    @room.code = "A-Cd_fあh1jK" # can't use multibytes
    assert_not @room.valid?
  end

  test "name should be present" do
    @room.name = "    "
    assert_not @room.valid?
  end

  test "name should be in appropriate length" do
    @room.name = "a"*@MAX_NAME_LENGTH
    assert @room.valid?
    @room.name = "a"*(@MAX_NAME_LENGTH + 1)
    assert_not @room.valid?
  end

  test "test for self.random_code" do
    code = Room.random_code
    assert_kind_of String, code # 文字列である
    assert_equal 8, code.length # 8文字である
    assert code.delete("a-zA-Z0-9_-").blank? # alphanum_-以外が使われていない
    code2 = Room.random_code
    assert_not_equal code, code2 # ほぼ毎回異なる文字列を生成する
  end

  test "test for .has_valid_code?" do
    assert @room.has_valid_code? # codeが有効であることを確認
    assert @room.errors.messages.count.zero? # エラーを持ち越さない
    @room.code = "P@ssw0rd" # 無効なcode
    assert_not @room.valid? # @roomが無効であることを確認
    assert_not @room.errors.messages.count.zero? # エラーがあることを確認
    assert_not @room.has_valid_code? # codeが無効であることを確認
    assert @room.errors.messages.count.zero? # エラーを持ち越さない
  end

end
