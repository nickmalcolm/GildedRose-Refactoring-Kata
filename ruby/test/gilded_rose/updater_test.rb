require 'test_helper'

class GildedRose::UpdaterTests < Test::Unit::TestCase

  test "if Item is Backstage Pass, and more than 10 days til sell_in, quality increases by one" do
    items = [GildedRose::Goods.good_for("Backstage passes to a TAFKAL80ETC concert", 11, 0)]
    GildedRose::Updater.new(items).update_quality()
    assert_equal 1, items[0].quality
  end

  test "if Item is Backstage Pass, and 10 >= sell_in > 5 , quality increases by two" do
    items = [GildedRose::Goods.good_for("Backstage passes to a TAFKAL80ETC concert", 10, 0)]
    GildedRose::Updater.new(items).update_quality()
    assert_equal 2, items[0].quality
  end

  test "if Item is Backstage Pass, and 5 >= sell_in > 0 , quality increases by three" do
    items = [GildedRose::Goods.good_for("Backstage passes to a TAFKAL80ETC concert", 5, 0)]
    GildedRose::Updater.new(items).update_quality()
    assert_equal 3, items[0].quality
  end

  test "if Item is Backstage Pass, and sell in is 0, quality is 0" do
    items = [GildedRose::Goods.good_for("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
    GildedRose::Updater.new(items).update_quality()
    assert_equal 0, items[0].quality
  end

end