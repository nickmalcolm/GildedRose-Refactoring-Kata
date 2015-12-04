module GildedRose
  module Goods

    def self.good_for(name, sell_in, quality)
      Base.new(name, sell_in, quality)
    end

  end
end

require 'gilded_rose/goods/base'
require 'gilded_rose/goods/aged_brie'