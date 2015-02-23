# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number.
# For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
#
# A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
#
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24.
# By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers.
# However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as
# the sum of two abundant numbers is less than this limit.
#
# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
#
# Written by http://github.com/mikelarkin

# We already have a function for sum of proper divisors:
limit = 28123

def sum_of_proper_divisors(number)
  divisors = []
  1.upto(number/2) do |n|
    divisors << n if number % n == 0
  end
  return divisors.inject(0) { |sum, addend| sum + addend }
end

def is_abundant?(number)
  number < sum_of_proper_divisors(number)
end

# Find all the abundant numbers (we only need to worry about 12 - (28123-12))
abundants = []
12.upto(limit - 12).each do |n|
  abundants << n if is_abundant?(n)
end

# Flag their sums
sieve = Array.new(limit) { |i| i }
until abundants.empty?
  i = abundants.shift

  # Number summed with itself
  sieve[i + i] = nil

  abundants.each do |j|
    break if (i+j) > limit
    sieve[i+j] = nil

  end
end

# Removes numbers that are are the sum of two abundant numbers
sieve.compact!

puts "The sum of all positive integers that are not the sum of two abundant numbers: #{sieve.inject(0) { |sum, addend| sum + addend }}"