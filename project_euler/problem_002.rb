# Each new term in the Fibonacci sequence is generated by adding the previous two terms.
# By starting with 1 and 2, the first 10 terms will be:
#
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
#
# By considering the terms in the Fibonacci sequence whose values do not exceed four million,
# find the sum of the even-valued terms.
# Written by http://github.com/mikelarkin

# Allow the upper limit to be set via the prompt, but default to 4,000,000
limit = (ARGV.empty? ? 4000000 : ARGV[0].to_i)

result = value = 0
previous = current = 1

while value < limit

  # Even values only
  result += value if (value % 2 == 0)

  # Shift the values
  previous, current = current, value

  # Next number in the sequence is the sum of the previous 2
  value = previous + current

end

puts "Answer for 1 - #{limit}:  #{result}"






