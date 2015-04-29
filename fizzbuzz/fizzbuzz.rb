# Write a program that prints the numbers from 1 to n. 
# But for multiples of three print “Fizz” instead of the number 
# and for the multiples of five print “Buzz”. 
# For numbers which are multiples of both three and five print “FizzBuzz”."

# Allow the upper limit to be set via the prompt, but default to 100
# limit = (ARGV.empty? ? 100 : ARGV[0].to_i)

result = ""
1.upto(1000).each do |n|
    # Use string interpolation to construct the expected responses
    output = "#{n % 3 == 0 ? "Fizz" : ""}#{n % 5 == 0 ? "Buzz" : ""}"

    # Print the number if it's not a special case
    result += output.empty? ? n.to_s : output.to_s
end
puts result