# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91x99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.
#
# Written by http://github.com/mikelarkin

first_number = second_number = result = 0
999.downto(100).each do |i|
  i.downto(100).each do |j|
    if (i * j).to_s == (i * j).to_s.reverse
      # Check and see if this is the highest match
      if (i * j) > result
        first_number, second_number = i, j
        result = first_number * second_number
      end
    end
  end
end


puts "#{first_number} * #{second_number} = #{result}"
