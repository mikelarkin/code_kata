# Write a program that prints the numbers from 1 to n.
# But for multiples of three print “Fizz” instead of the number
# and for the multiples of five print “Buzz”.
# For numbers which are multiples of both three and five print “FizzBuzz”."

# Allow the upper limit to be set via the prompt, but default to 100
# limit = (ARGV.empty? ? 10000000 : ARGV[0].to_i)

result = ""
1.upto(1000).each do |n|
  # Use string interpolation to construct the expected responses
  # if (n % 3 == 0) && (n % 5 == 0)
  if (n % 15 == 0)
    result += "FizzBuzz"
  elsif n % 3 == 0
    result += "Fizz"
  elsif n % 5 == 0
    result += "Buzz"
  else
    result += n.to_s
  end
end
puts result