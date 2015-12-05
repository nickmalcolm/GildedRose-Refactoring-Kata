module GildedRose::Goods
  # With a Ticket, the quality increases as the concert approaches,
  # and becomes worthless after the concert
  class Ticket < Base

    # Override to use a maximum quality which changes over time
    def age_quality
      @quality = GildedRose::Util.confine_to_range(
        @quality + quality_modifier,
        min: @min_quality, max: time_based_max_quality
      )
    end

    # Returns a maxmimum quality value, based on the sell_in attributes.
    # After sell_in has passed, the max quality is 0
    def time_based_max_quality
      @sell_in >= 0 ? @max_quality : 0
    end

    # A Ticket's quality increases by an increasing amount as the concert
    # approaches
    def quality_modifier
      # If the concert is more than 10 days away, the quality increases by one
      if @sell_in >= 10
        base_quality_modifier
      elsif @sell_in >= 5
        base_quality_modifier * 2
      elsif @sell_in >= 0
        base_quality_modifier * 3
      else
        0
      end
    end

  end
end