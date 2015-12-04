require 'test_helper'

class GildedRose::UpdaterTests < Test::Unit::TestCase

  test "quality never decreases below zero" do
    items = [GildedRose::Goods.good_for("foo", 0, 0)]
    GildedRose::Updater.new(items).update_quality()
    assert_equal 0, items[0].quality
  end

  test "when sell_in is not in the past, update quality reduces quality by one" do
    items = [GildedRose::Goods.good_for("foo", 0, 2)]
    GildedRose::Updater.new(items).update_quality()
    assert_equal 0, items[0].quality
  end

  test "when sell_in is in the past, quality reduces by two, by default" do
    items = [GildedRose::Goods.good_for("foo", -1, 2)]
    GildedRose::Updater.new(items).update_quality()
    assert_equal 0, items[0].quality
  end

  test "sell_in reduces by one" do
    items = [GildedRose::Goods.good_for("foo", 0, 0)]
    GildedRose::Updater.new(items).update_quality()
    assert_equal -1, items[0].sell_in
  end

  test "if Item is named Aged Brie, quality increases to 50" do
    items = [GildedRose::Goods.good_for("Aged Brie", 0, 49)]
    GildedRose::Updater.new(items).update_quality()
    assert_equal 50, items[0].quality
    GildedRose::Updater.new(items).update_quality()
    assert_equal 50, items[0].quality, "Should stay at 50"
  end

  test "if Item is named Sulfuras, quality doesn't decrease" do
    items = [GildedRose::Goods.good_for("Sulfuras, Hand of Ragnaros", 0, 10)]
    GildedRose::Updater.new(items).update_quality()
    assert_equal 10, items[0].quality
  end

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