require 'item'
module GildedRose::Goods
  class Base < Item

    attr_accessor :min_quality, :max_quality

    def initialize(*args)
      super(*args)
      @min_quality = 0
      @max_quality = nil
    end

    def age
      age_quality
      age_sell_in
    end

    def age_sell_in
      @sell_in -= 1
    end

    def age_quality
      @quality += quality_modifier if can_decrease_quality?
    end

    def can_decrease_quality?
      @quality > @min_quality
    end

    def quality_modifier
      # When past its sell_in date, the quality drops by two
      if @sell_in >= 0
        -1
      else
        -2
      end
    end

  end
end