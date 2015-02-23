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

limit = (ARGV.empty? ? 100 : ARGV[0].to_i)

sum_of_squares = sum = 0

# Time both methods

brute_start_time = Time.now
1.upto(limit) do |n|
  sum_of_squares += n*n
  sum += n
end

brute_end_time = Time.now
puts "(Brute force time: #{((brute_end_time - brute_start_time) * 1000)}ms) Difference between sum of the squares and the square of the sum : #{(sum*sum) -sum_of_squares}"

closed_start_time = Time.now
sum_of_squares = (limit * (limit+1) * (2* limit + 1))/6
sum = (limit * (limit+1))/2
closed_end_time = Time.now

puts "(Closed form time: #{((closed_end_time - closed_start_time) * 1000)}ms) Difference between sum of the squares and the square of the sum : #{(sum*sum) - sum_of_squares}"
