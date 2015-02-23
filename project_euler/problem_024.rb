# A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4.
# If all of the permutations are listed numerically or alphabetically, we call it lexicographic order.
# The lexicographic permutations of 0, 1 and 2 are:
#
# 012   021   102   120   201   210
#
# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
#
# Written by http://github.com/mikelarkin
#

array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
size = array.size - 1

999999.times do

  found = false
  size.downto(0).each do |k|

    if array[k] > array[k-1]
      size.downto(0).each do |l|
        if array[l] > array[k-1]
          array[l], array[k-1] = array[k-1], array[l]

          # Reverse elements k - n to "reset" the permutation
          array << array.slice!(k..array.size).reverse

          array.flatten!
          found = true
          break
        end
      end
      break if found
    end
  end
end

puts array.join