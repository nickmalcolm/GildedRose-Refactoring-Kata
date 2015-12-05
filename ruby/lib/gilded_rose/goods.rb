module GildedRose
  module Goods

    def self.good_for(name, sell_in, quality)
      options = case name
      when "Aged Brie"
        {max_quality: 50, base_quality_modifier: +1}
      else
        {}
      end

      Base.new(name, sell_in, quality, **options)
    end

  end
end

require 'gilded_rose/goods/base'