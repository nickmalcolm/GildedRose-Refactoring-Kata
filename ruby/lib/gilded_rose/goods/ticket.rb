require 'item'
module GildedRose::Goods
  class Ticket < Base

    # With a Ticket, the quality increases as the concert approaches,
    # and becomes worthless after the concert

    def age_quality
      @quality = GildedRose::Util.confine_to_range(
        @quality + quality_modifier,
        min: @min_quality, max: time_based_max_quality
      )
    end

    # Override max quality, so that after sell_in has passed, the max quality
    # is 0
    def time_based_max_quality
      @sell_in > 0 ? @max_quality : 0
    end

    def quality_modifier
      # If the concert is more than 10 days away, the quality increases by one
      if @sell_in > 10
        base_quality_modifier
      elsif @sell_in > 5
        base_quality_modifier * 2
      elsif @sell_in > 0
        base_quality_modifier * 3
      else
        0
      end
    end

  end
end