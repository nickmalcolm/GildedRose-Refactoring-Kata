require 'test_helper'

# Test against 100 days of output, from
# https://raw.githubusercontent.com/ArturT/GildedRose-Refactoring-Kata/solutions/ruby/golden_master.txt
class GoldenMasterTest < Test::Unit::TestCase

  def setup
    golden_master = File.read('./test/golden_master.txt')
    @golden_master_lines = golden_master.split("\n")
  end

  test "golden master test" do
    current_output = `ruby -Itest test/texttest_fixture.rb 100`
    current_output_lines = current_output.split("\n")

    buffer = []

    @golden_master_lines.each_with_index do |golden_line, i|
      buffer << golden_line
      buffer.shift if buffer.length > 20 # rolling buffer of the last 20 lines

      assert_equal golden_line, current_output_lines[i], "\n\n\n" + buffer.join("\n") + "\n\n\n"
    end
  end

end