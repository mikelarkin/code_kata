# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
#
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
#
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.
#
# Written by http://github.com/mikelarkin


def factorial(number)
  return 0 if number.to_i < 1
  return (1..number.to_i).reduce(:*)
end

total = 0

# We only need to check 6 digit numbers since 7 * (9^5) > 999999
3.upto(1000000).each do |number|
# Break the number into digits and sum up the fifth powers
  sum = number.to_s.split(//).inject(0) { |sum, n| sum + factorial(n) }

# See if it equals the original number, and if so add it to the total
  if sum == number
    puts number
    total += sum
  end
end

puts "Sum: #{total}"

