# Lychrel numbers
#
# If we take 47, reverse and add, 47 + 74 = 121, which is palindromic.
#
# Not all numbers produce palindromes so quickly. For example,
#
# 349 + 943 = 1292,
# 1292 + 2921 = 4213
# 4213 + 3124 = 7337
#
# That is, 349 took three iterations to arrive at a palindrome.
#
# Although no one has proved it yet, it is thought that some numbers, like 196, never produce a palindrome.
# A number that never forms a palindrome through the reverse and add process is called a Lychrel number.
#
# Due to the theoretical nature of these numbers, and for the purpose of this problem, we shall assume that a number is Lychrel
# until proven otherwise. In addition you are given that for every number below ten-thousand,
# it will either
# (i) become a palindrome in less than fifty iterations, or,
# (ii) no one, with all the computing power that exists, has managed so far to map it to a palindrome.
# In fact, 10677 is the first number to be shown to require over fifty iterations
# before producing a palindrome: 4668731596684224866951378664 (53 iterations, 28-digits).
#
# Surprisingly, there are palindromic numbers that are themselves Lychrel numbers; the first example is 4994.
#
# How many Lychrel numbers are there below ten-thousand?
#
# NOTE: Wording was modified slightly on 24 April 2007 to emphasise the theoretical nature of Lychrel numbers.
#
# Written by http://github.com/mikelarkin

limit = (ARGV.empty? ? 9999 : ARGV[0].to_i)

def is_palindromic?(number)
  return number.to_s.reverse == number.to_s
end

def is_lychrel?(number)
  result = number
  49.times do |iterations|
    # Reverse and add
    result = result + result.to_s.reverse.to_i
    # Check if it's palindromic
    if is_palindromic?(result)
      return false
    end
  end
  return true

end

lychrel_numbers = []

1.upto(limit) do |number|
  lychrel_numbers << number if is_lychrel?(number)
end


puts "There are #{lychrel_numbers.size} Lychrel numbers below 10000"

