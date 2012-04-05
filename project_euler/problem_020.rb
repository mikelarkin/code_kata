# n! means n x (n  1) x ... x 3 x 2 x 1
#
# For example, 10! = 10 x 9 x ... x 3 x 2 x 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
#
# Find the sum of the digits in the number 100!
limit = (ARGV.empty? ? 100 : ARGV[0].to_i)

product = 1

1.upto(limit) do |n|
  product *= n
end

puts "Sum of the digits of #{limit}! is #{(product).to_s.split(//).inject(0) {|sum, n| sum + n.to_i}}"