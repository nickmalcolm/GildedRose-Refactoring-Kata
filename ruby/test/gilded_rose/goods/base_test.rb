require 'test_helper'

class BaseTest < Test::Unit::TestCase

  def setup
    @klass = GildedRose::Goods::Base
  end

  test "Goods::Base acts like Item" do
    good = @klass.new("foo", 1, 2)
    assert_equal "foo", good.name
    assert_equal 1, good.sell_in
    assert_equal 2, good.quality
  end

  test "quality never decreases below zero" do
    item = @klass.new("foo", 0, 0)
    item.age
    assert_equal 0, item.quality
  end

  test "quality never increases beyond max_quality" do
    item = @klass.new("foo", 0, 0, base_quality_modifier: +1, max_quality: 1)
    item.age
    assert_equal 1, item.quality
    item.age
    assert_equal 1, item.quality, "Quality should remain at maximum"
  end

  test "when sell_in is not in the past, update quality reduces quality by one" do
    item = @klass.new("foo", 0, 1)
    item.age
    assert_equal 0, item.quality
  end

  test "when sell_in is in the past, quality reduces by two, by default" do
    item = @klass.new("foo", -1, 2)
    item.age
    assert_equal 0, item.quality
  end

  test "sell_in reduces by one" do
    item = @klass.new("foo", 0, 0)
    item.age
    assert_equal -1, item.sell_in
  end

end