# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a != b, then a and b are an amicable pair and each of a and b are called amicable numbers.
#
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284
# are 1, 2, 4, 71 and 142; so d(284) = 220.
#
# Evaluate the sum of all the amicable numbers under 10000.
#
# Written by http://github.com/mikelarkin

limit = (ARGV.empty? ? 10000 : ARGV[0].to_i)

# Returns an array of proper divisors for a number
def sum_of_proper_divisors(number)
  divisors = []
  1.upto(number/2) do |n|
    divisors << n if number % n == 0
  end
  return divisors.inject(0) {|sum, addend| sum + addend}
end

# Iterate up to the limit, finding amicable pairs
pairs = []
1.upto(limit) do |n|
  sum = sum_of_proper_divisors(n)
  pairs << [n, sum] if (sum != n) && (sum_of_proper_divisors(sum) == n)

end

pairs.flatten!
pairs.uniq!
puts "Sum of amicable pairs up to #{limit}: #{pairs.inject(0) {|sum, addend| sum + addend}}"