# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million.


# Written by http://github.com/mikelarkin

# Using Sieve of Eratosthenes

limit = (ARGV.empty? ? 2000000 : ARGV[0].to_i)

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
puts "Sum of all primes below #{limit} is #{sieve.inject(0) {|sum, n| sum + n }}"