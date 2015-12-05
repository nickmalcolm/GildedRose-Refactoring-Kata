module GildedRose::Goods
  class AgedBrie < Base

    NAME = "Aged Brie"

    def initialize(*args)
      super
      # Aged Brie increases in quality with age
      @base_quality_modifier = +1
      @max_quality = 50
    end

  end
end