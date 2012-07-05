# Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:
#
# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13
#
# It can be verified that the sum of the numbers on the diagonals is 101.
#
# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?
#
# Written by http://github.com/mikelarkin

require 'pp'

# Grab the grid size
limit = (ARGV.empty? ? 5 : ARGV[0].to_i)

grid = Array.new(limit) { Array.new(limit) }

i = j = limit / 2

leftbound = i
rightbound = i
topbound = i
bottombound = i
# Spiral out from the middle
(limit * limit).times do |n|
  grid[i][j] = n

  leftbound
  #i = (i+1) % limit


end

pp grid