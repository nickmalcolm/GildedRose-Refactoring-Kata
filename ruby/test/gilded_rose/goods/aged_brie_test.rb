require 'test_helper'

class AgedBrieTest < Test::Unit::TestCase

  def setup
    @klass = GildedRose::Goods::AgedBrie
  end

  test "quality increases by one" do
    brie = @klass.new("Aged Brie", 0, 0)
    brie.age
    assert_equal 1, brie.quality
  end

  test "quality does not increase beyond 50" do
    brie = @klass.new("Aged Brie", 0, 50)
    brie.age
    assert_equal 50, brie.quality, "Should stay at 50"
  end

end