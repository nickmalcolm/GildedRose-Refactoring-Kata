require 'test_helper'

class UtilTest < Test::Unit::TestCase

  test "can confine a value to a range from 0 to infinity" do
    assert_equal 0, GildedRose::Util.confine_to_range(-1, min: 0)
    assert_equal 1234, GildedRose::Util.confine_to_range(1234, min: 0)
  end

  test "can confine a value to a range from -infinity to 0" do
    assert_equal -1234, GildedRose::Util.confine_to_range(-1234, min: nil, max: 0)
    assert_equal 0, GildedRose::Util.confine_to_range(1, min: nil, max: 0)
  end

  test "can confine a value to a range from 0 to 1" do
    assert_equal 0, GildedRose::Util.confine_to_range(-1, min: 0, max: 1)
    assert_equal 0, GildedRose::Util.confine_to_range(0, min: 0, max: 1)
    assert_equal 1, GildedRose::Util.confine_to_range(1, min: 0, max: 1)
    assert_equal 1, GildedRose::Util.confine_to_range(2, min: 0, max: 1)
  end

end