# The sum of the squares of the first ten natural numbers is,
#
# 1^2 + 2^2 + ... + 10^2 = 385
# The square of the sum of the first ten natural numbers is,
#
# (1 + 2 + ... + 10)^2 = 55^2 = 3025
#
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 - 385 = 2640.
#
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
#
# Written by http://github.com/mikelarkin

sum_of_squares = sum = 0

1.upto(100) do |n|
  sum_of_squares += n*n
  sum += n
end

puts "Difference between sum of the squares and the square of the sum : #{(sum * sum) - sum_of_squares}"