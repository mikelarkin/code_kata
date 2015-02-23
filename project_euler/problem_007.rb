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
sieve[0] = sieve[1] = nil

2.upto(limit ** 0.5) do |i|
  next unless sieve[i]
  (i*i).step(limit, i) do |j|
    sieve[j] = nil
  end

end


# Remove nil (non-prime) numbers
sieve.compact!
puts "Prime ##{nth_prime} is #{sieve[nth_prime - 1]}"