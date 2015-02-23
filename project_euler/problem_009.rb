# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
#
# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
#
# Written by http://github.com/mikelarkin


# Using Euclid's formula ( m > n)
# a = m^2 - n^2
# b = 2mn
# c = m^2 + n^2

found = false
a = b = c = 0

# Iterate through and find the matching Pythagorean triplet
for m in (1..998) do

  for n in (1..(m-1)) do

    a = (m*m) - (n*n)
    b = 2*m*n
    c = (m*m) + (n*n)
    if a + b + c == 1000
      found = true
      break
    end
  end

  break if found
end

puts "Product for Pythagorean triple #{a}, #{b}, #{c}: #{a * b *c}"

