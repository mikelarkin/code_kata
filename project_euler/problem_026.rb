# A unit fraction contains 1 in the numerator.
# The decimal representation of the unit fractions with denominators 2 to 10 are given:
#
# 1/2	= 	0.5
# 1/3	= 	0.(3)
# 1/4	= 	0.25
# 1/5	= 	0.2
# 1/6	= 	0.1(6)
# 1/7	= 	0.(142857)
# 1/8	= 	0.125
# 1/9	= 	0.(1)
# 1/10	= 	0.1
# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.
#
# Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.
#
# Written by http://github.com/mikelarkin
require 'bigdecimal'
limit = (ARGV.empty? ? 10 : ARGV[0].to_i)
pattern = result = ""
longest = 0

# This can be done with a simple regex
# Store the number and the size of the matched pattern
(2).upto(limit) do |d|
  pattern = %r/(.+?)\1+?/.match("%.100f" % (BigDecimal.new("1.0")/BigDecimal.new(d.to_f.to_s)))

  puts "%.100f" % (BigDecimal.new("1.0")/BigDecimal.new(d.to_f.to_s))

  # Need to filter out repeated single digits by seeing if the are all the same
  if pattern && pattern[1].split('').all? { |value| value == pattern[1][0] }
    next
  else
    if pattern && pattern[1].size > longest
      longest = d
      result = pattern[1]
    end
  end
end

puts "Longest recurring cycle is: #{longest} with pattern #{result}"