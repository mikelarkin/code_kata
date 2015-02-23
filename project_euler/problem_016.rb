# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#
# What is the sum of the digits of the number 2^1000?
#
# Written by http://github.com/mikelarkin

puts "Sum of the digits of 2^1000: #{(2**1000).to_s.split(//).inject(0) {|sum, n| sum + n.to_i}}"