require 'item'
module GildedRose::Goods
  class Base < Item

    # A Good cannot be less than 0 quality
    DEFAULT_MIN_QUALITY = 0
    # A Good cannot have a quality greater than 50
    DEFAULT_MAX_QUALITY = 50
    # As it ages, a Good decreases in quality by one
    DEFAULT_QUALITY_MODIFIER = -1

    attr_accessor :min_quality,
      :max_quality,
      :base_quality_modifier,
      :modifiable

    # Creates a Good which can be aged.
    # name:       (String) The name of this Good
    # sell_in:    (Integer) The number of days in which to sell this item
    # quality:    (Integer) The quality of the Good
    # options:        (Optional) All have defaults
    #   min_quality:  A lower bound on the quality of this Good
    #   max_quality:  An upper bound on the quality of this Good
    #   base_quality_modifier:  Each time it ages, the amount we should modify
    #                           the Good's quality
    #   modifiable:   Whether this Good is modifiable at all
    def initialize(name, sell_in, quality, **options)
      super(name, sell_in, quality)
      @min_quality            = options[:min_quality] || DEFAULT_MIN_QUALITY
      @max_quality            = options[:max_quality] || DEFAULT_MAX_QUALITY
      @base_quality_modifier  = options[:base_quality_modifier] || DEFAULT_QUALITY_MODIFIER
      @modifiable             = options.has_key?(:modifiable) ? options[:modifiable] : true
    end

    def age
      return unless @modifiable
      age_sell_in
      age_quality
    end

    def age_sell_in
      @sell_in -= 1
    end

    # Will age this Good's quality, within the min and max quality
    def age_quality
      @quality = GildedRose::Util.confine_to_range(
        @quality + quality_modifier,
        min: @min_quality, max: @max_quality
      )
    end

    # Returns the amount to modify this Good by as it ages.
    def quality_modifier
      # When past its sell_in date, the quality drops by two
      if @sell_in >= 0
        base_quality_modifier
      else
        base_quality_modifier * 2
      end
    end

  end
end