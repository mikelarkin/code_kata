# The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
#
# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
#
# How many circular primes are there below one million?
#
# Written by http://github.com/mikelarkin

limit = (ARGV.empty? ? 1000000 : ARGV[0].to_i)

# This method rotates the characters in a string one to the left
# for example, 123 would return as [123, 231, 312]
def rotations(string)
  #array = string.split(//)
  #array2 = array.map {|element| }

  return (0...string.length).map { |i| (string * 2)[i, string.length] }

end

# Create a list of primes using the Sieve of Eratosthenes
# Initialize a large enough array
sieve = Array.new(limit) { |i| i }
sieve[0] = sieve[1] = nil

2.upto(limit ** 0.5) do |i|

  next unless sieve[i]
  (i*i).step(limit, i) do |j|
    sieve[j] = nil
  end
end


# 2 is the only even numbered prime, all the rest are odd
results = [2]

# Only check odd numbers > 2
# TODO: {}ptimization would be to make sure we don't check the same number more than once.

3.step(limit, 2) do |i|
  # Grab each rotation
  r = rotations(i.to_s)
  results << r if r.all? {|j| sieve[j.to_i]}
end

results.flatten!
results.uniq!

puts results
puts "The number of circular primes under #{limit} is: #{results.size}"