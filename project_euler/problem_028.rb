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

# Grab the grid size
limit = (ARGV.empty? ? 1001 : ARGV[0].to_i)

grid = Array.new(limit) { Array.new(limit) }

# Prime the number of steps in each direction
right_steps = 1
down_steps = 1
left_steps = 2
up_steps = 2


# Start in the middle
i = j = limit / 2

# Record the starting value
n = 1
grid[i][j] = n


# Spiral out from the middle
while n <= (limit*limit) do

  # Go right
  right_steps.times do
    break if n >= (limit*limit)
    n+=1
    j+=1
    grid[i][j] = n

  end

  break if n >= (limit*limit)

  # Go down
  down_steps.times do
    n+=1
    i+=1
    grid[i][j] = n
    break if n >= (limit*limit)
  end

  break if n >= (limit*limit)

  # Go left
  left_steps.times do
    n+=1
    j-=1
    grid[i][j] = n
    break if n >= (limit*limit)
  end

  break if n >= (limit*limit)

  # Go up
  up_steps.times do
    n+=1
    i-=1
    grid[i][j] = n
    break if n >= (limit*limit)
  end

  right_steps += 2
  down_steps += 2
  left_steps += 2
  up_steps += 2

end

sum = 0
# Sum the diagonals
0.upto(limit - 1) do |n|
  sum += grid[n][n]
  sum += grid[(limit-1)-n][n]
end

# Correct for counting 1 twice
puts sum - 1