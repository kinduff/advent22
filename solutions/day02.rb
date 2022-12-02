# frozen_string_literal: true

require_relative '../lib/utils'

input = IO.read('day02.txt', chomp: true)

test_input = 'A Y
B X
C Z
'

# --- Part One ---

def solve_1(input)
  score = 0

  win_map = { 'A' => 'Y', 'B' => 'Z', 'C' => 'X' }

  input.split("\n").each do |game|
    a, b = game.split(' ')

    score += ['X', 'Y', 'Z'].index(b) + 1

    if win_map[a] == b
      score += 6
    elsif ['A', 'B', 'C'].index(a) == ['X', 'Y', 'Z'].index(b)
      score += 3
    end
  end

  score
end

assert_equal solve_1(test_input), 15
psol '1', solve_1(input)

# --- Part Two ---

def solve_2(input)
  score = 0

  win_map = { 'A' => 'Y', 'B' => 'Z', 'C' => 'X' }
  lose_map = { 'A' => 'Z', 'B' => 'X', 'C' => 'Y' }

  input.split("\n").each do |game|
    a, b = game.split(' ')

    answer = case b
      when 'X'
        lose_map[a]
      when 'Y'
        ['X', 'Y', 'Z'][['A', 'B', 'C'].index(a)]
      when 'Z'
        win_map[a]
      end

    score += ['X', 'Y', 'Z'].index(answer) + 1

    if win_map[a] == answer
      score += 6
    elsif ['A', 'B', 'C'].index(a) == ['X', 'Y', 'Z'].index(answer)
      score += 3
    end
  end

  score
end

assert_equal solve_2(test_input), 12
psol '2', solve_2(input)
