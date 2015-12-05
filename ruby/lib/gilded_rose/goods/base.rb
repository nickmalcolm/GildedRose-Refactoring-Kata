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

    def initialize(name, sell_in, quality, **options)
      super(name, sell_in, quality)
      @min_quality            = options[:min_quality] || DEFAULT_MIN_QUALITY
      @max_quality            = options[:max_quality] || DEFAULT_MAX_QUALITY
      @base_quality_modifier  = options[:base_quality_modifier] || DEFAULT_QUALITY_MODIFIER
      @modifiable             = options.has_key?(:modifiable) ? options[:modifiable] : true
    end

    def age
      return unless @modifiable
      age_quality
      age_sell_in
    end

    def age_sell_in
      @sell_in -= 1
    end

    def age_quality
      @quality = GildedRose::Util.confine_to_range(
        @quality + quality_modifier,
        min: @min_quality, max: @max_quality
      )
    end

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