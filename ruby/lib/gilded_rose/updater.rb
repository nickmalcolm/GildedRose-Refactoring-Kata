module GildedRose
  # Updater will take an array of items, and allow you to update their quality
  # over time.
  class Updater

    def initialize(items)
      @items = items
    end

    def update_quality
      @items.map(&:age)
    end

  end
end