# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
#
# Written by http://github.com/mikelarkin

# Allow the number to be set via the command prompt

found = false
dividend = 2520 # Start here because we know it has to be greater than this

# Only check 11 - 20, since 1 - 10 are all factors of the larger numbers

while !found
  dividend += 20
  found = (11.upto(20)).all? {|n| dividend % n == 0}

end

puts "Smallest number divisible by (1 - 20): #{dividend}"