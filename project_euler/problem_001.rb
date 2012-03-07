#!/usr/bin/env ruby
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. 
# The sum of these multiples is 23.
# 
# Find the sum of all the multiples of 3 or 5 below 1000.
# Written by http://github.com/mikelarkin

# Allow the upper limit to be set via the prompt, but default to 999
limit = (ARGV.empty? ? 999 : ARGV[0].to_i)

# Brute force it
result = 0
(1..limit).each do |n|
  result += n if ((n % 3 == 0) || (n % 5 == 0))
end

puts "Answer for 1 - #{limit}:  #{result}"