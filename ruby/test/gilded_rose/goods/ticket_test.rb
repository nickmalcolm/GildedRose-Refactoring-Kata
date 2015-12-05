require 'test_helper'

class TicketTest < Test::Unit::TestCase

  def setup
    @klass = GildedRose::Goods::Ticket
    @aging_options = GildedRose::Goods.aging_options_for("Backstage passes to a TAFKAL80ETC concert")
  end

  test "if more than 10 days til sell_in, quality increases by one" do
    ticket = @klass.new("foo", 11, 0, **@aging_options)
    ticket.age
    assert_equal 1, ticket.quality
  end

  test "if sell_in is between 5 and 10 days, quality increases by two" do
    ticket = @klass.new("foo", 10, 0, **@aging_options)
    ticket.age
    assert_equal 2, ticket.quality
  end

  test "if less than 5 days, quality increases by three" do
    ticket = @klass.new("foo", 5, 0, **@aging_options)
    ticket.age
    assert_equal 3, ticket.quality
  end

  test "if sell in is 0, quality is 0" do
    ticket = @klass.new("foo", 0, 10, **@aging_options)
    ticket.age
    assert_equal 0, ticket.quality
  end

  test "if sell in is -1, quality is 0" do
    ticket = @klass.new("foo", -1, 10, **@aging_options)
    ticket.age
    assert_equal 0, ticket.quality
  end

end