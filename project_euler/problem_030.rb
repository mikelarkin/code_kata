# Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
#
# 1634 = 1^4 + 6^4 + 3^4 + 4^4
# 8208 = 8^4 + 2^4 + 0^4 + 8^4
# 9474 = 9^4 + 4^4 + 7^4 + 4^4
# As 1 = 1^4 is not a sum it is not included.
#
# The sum of these numbers is 1634 + 8208 + 9474 = 19316.
#
# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
#
# Written by http://github.com/mikelarkin

total = 0

# We only need to check 6 digit numbers since 7 * (9^5) > 999999
2.upto(999999).each do |number|
# Break the number into digits and sum up the fifth powers
  sum = number.to_s.split(//).inject(0) { |sum, n| sum + (n.to_i ** 5) }

# See if it equals the original number, and if so add it to the total
  if sum == number
    puts number
    total += sum
  end
end

puts "Sum: #{total}"