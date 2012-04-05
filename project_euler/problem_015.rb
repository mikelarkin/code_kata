# Starting in the top left corner of a 2x2 grid, there are 6 routes (without backtracking) to the bottom right corner.
#
# How many routes are there through a 20x20 grid?
#
# Written by http://github.com/mikelarkin


# Grab the grid size
limit = (ARGV.empty? ? 2 : ARGV[0].to_i)

grid = Array.new(limit) {Array.new(limit)}

start = [0, 0]
finish = [limit - 1, limit - 1]

# "Without backtracking" means we can only move down or right

