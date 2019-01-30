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
    @room.code = "MyString1" # already in fixtures
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

end
