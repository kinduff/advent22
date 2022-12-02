# frozen_string_literal: true

require_relative '../lib/utils'

input = IO.read('day01.txt', chomp: true)

test_input = '1000
2000
3000

4000

5000
6000

7000
8000
9000

10000
'

# --- Part One ---

def solve_1(input)
  input.split("\n\n").map do |nums|
    nums.split("\n").map(&:to_i).inject(:+)
  end.max
end

assert_equal solve_1(test_input), 24_000
psol '1', solve_1(input)

# --- Part Two ---

def solve_2(input)
  input.split("\n\n").map do |nums|
    nums.split("\n").map(&:to_i).inject(:+)
  end.sort.reverse.first(3).inject(:+)
end

assert_equal solve_2(test_input), 45_000
psol '2', solve_2(input)
