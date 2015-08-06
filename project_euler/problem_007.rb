# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
#
# What is the 10,001st prime number?
#
# Written by http://github.com/mikelarkin

# Using Sieve of Eratosthenes
nth_prime = (ARGV.empty? ? 10001 : ARGV[0].to_i)
limit = nth_prime * 100

# Initialize a large enough array
sieve = Array.new(limit) { |i| i }

# Go ahead and knock out 0 and 1
sieve[0] = sieve[1] = nil

# Iterate up to the sqrt of the array size (since anything beyond this will be a multiple of a previous number)
2.upto(limit ** 0.5) do |i|

  # Already marked off as not prime?
  next unless sieve[i]

  # Mark off multiples of the current iterator since they are not prime
  (i*i).step(limit, i) do |j|
    sieve[j] = nil
  end

end


# Remove nil (non-prime) numbers by trimming the nils
sieve.compact!
puts "Prime ##{nth_prime} is #{sieve[nth_prime - 1]}"
