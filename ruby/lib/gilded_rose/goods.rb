module GildedRose
  module Goods

    def self.good_for(name, sell_in, quality)
      aging_options = self.aging_options_for(name)
      klass = self.klass_for(name)

      klass.new(name, sell_in, quality, **aging_options)
    end

    def self.klass_for(name)
      Base
    end

    def self.aging_options_for(name)
      case name
      when "Aged Brie"
        {max_quality: 50, base_quality_modifier: +1}
      when "Sulfuras, Hand of Ragnaros"
        # Sulfuras does not change quality
        {base_quality_modifier: +0}
      else
        {}
      end
    end

  end
end

require 'gilded_rose/goods/base'