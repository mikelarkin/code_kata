# The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.
#
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
#
# (Please note that the palindromic number, in either base, may not include leading zeros.)

# Find all the base 10 palindromes
limit = (ARGV.empty? ? 999999 : ARGV[0].to_i)
sum = 0

1.upto(limit).each do |i|
  if i.to_s == i.to_s.reverse && i.to_s(2) == i.to_s(2).reverse
    sum += i
  end
end

puts "The sum of numbers under #{limit + 1} that are palindromes in both base 10 and base 2 is: #{sum}"