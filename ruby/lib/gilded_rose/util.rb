module GildedRose
  module Util

    # Confines a value to a range of values.
    def self.confine_to_range(value, min: 0, max: nil)
      # If there is an upper bound, confine
      value = max ? [value, max].min : value
      # If there is a lower bound, confine
      min ? [min,  value].max : value
    end

  end
end