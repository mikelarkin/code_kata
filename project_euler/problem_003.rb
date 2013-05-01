# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143 ?
#
# Written by http://github.com/mikelarkin
# Original algorithm taken from http://www.benrady.com/2009/11/katarubyprime-factors.html


# Allow the number to be set via the prompt, otherwise default to problem spec
number = (ARGV.empty? ? 600851475143 : ARGV[0].to_i)


def generate_prime_factors(number)
  # Exit the recursion
  return [] if number < 2

  # Keep dividing by factors until we find one that goes in evenly
  factor = (2..number).find {|x| number % x == 0}

  # Divide by the prime factor and repeat
  [factor] + generate_prime_factors(number / factor)
end

factors = generate_prime_factors(number)
puts "Largest prime factor of #{number}: #{factors.max}"