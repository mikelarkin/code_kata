# The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:
#
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#
# Let us list the factors of the first seven triangle numbers:
#
#  1: 1
#  3: 1,3
#  6: 1,2,3,6
# 10: 1,2,5,10
# 15: 1,3,5,15
# 21: 1,3,7,21
# 28: 1,2,4,7,14,28
# We can see that 28 is the first triangle number to have over five divisors.
#
# What is the value of the first triangle number to have over five hundred divisors?
#
# Written by http://github.com/mikelarkin

found = false
number = 1
term = 0

while !found

  # Reset the factor counter
  factor_count = 0

  # Find the next term
  term += number

  # Only have to check up to the sqrt
  sqrt = (term ** 0.5)

  # Count the factors
  (1..sqrt).each {|n|  factor_count += 2 if (term % n).zero? }

  # Correction for perfect squares
  factor_count -= 1 if (sqrt * sqrt == term)

  # Increment our counter
  number += 1

  # Exit if we've found the answer
  found = factor_count > 500
end

puts "First Triangle Number with over 500 divisors: #{term}"
