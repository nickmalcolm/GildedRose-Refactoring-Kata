module GildedRose
  module Goods

    def self.good_for(name, sell_in, quality)
      klass = case name
      when AgedBrie::NAME
        AgedBrie
      else
        Base
      end

      klass.new(name, sell_in, quality)
    end

  end
end

require 'gilded_rose/goods/base'
require 'gilded_rose/goods/aged_brie'