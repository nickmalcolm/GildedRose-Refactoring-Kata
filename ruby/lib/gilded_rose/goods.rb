module GildedRose
  module Goods

    # Returns a Good for a given name which will act appropriately
    def self.good_for(name, sell_in, quality)
      aging_options = self.aging_options_for(name)
      klass = self.klass_for(name)

      klass.new(name, sell_in, quality, **aging_options)
    end

    def self.klass_for(name)
      case name
      when "Backstage passes to a TAFKAL80ETC concert"
        Ticket
      else
        Base
      end
    end

    def self.aging_options_for(name)
      case name
      when "Aged Brie"
        {max_quality: 50, base_quality_modifier: +1}
      when "Sulfuras, Hand of Ragnaros"
        # Sulfuras does not change quality
        {modifiable: false}
      when "Backstage passes to a TAFKAL80ETC concert"
        {base_quality_modifier: +1}
      when "Conjured Mana Cake"
        {base_quality_modifier: -2}
      else
        {}
      end
    end

  end
end

require 'gilded_rose/goods/base'
require 'gilded_rose/goods/ticket'