#Write a binary chop method that takes an integer search target and a sorted array of integers.
# It should return the integer index of the target in the array, or -1 if the target is not in the array.
# The signature will logically be:
#
#   chop(int, array_of_int)  -> int
#
# You can assume that the array has less than 100,000 elements. For the purposes of this Kata, time and memory
# performance are not issues (assuming the chop terminates before you get bored and kill it, and that you
# have enough RAM to run it).


# Implementation One:  Iterative
# Written by http://github.com/mikelarkin

module ImplementationOne

  def self.chop(search, array)

    # Initial boundary check
    return -1 if array.size == 0

    # Variables to store visit locations
    bottom = 0
    top = array.size - 1

    # Start in the middle of the array
    index = (array.size / 2)

    # Max iterations is (array size / 2) + 1
    (array.size / 2 + 1).times do |n|
      # See if the element is equal (found it), larger, or smaller
      if array[index] == search
        return index # offset because arrays start at 0
      elsif array[index] > search
        top = index - 1
      elsif array[index] < search
        bottom = index + 1
      end

      # Otherwise check the next spot, rounding up
      index = ((top + bottom) / 2)

      # Return -1 if we've searched the whole array not found it
      return -1 if (top == bottom) && array[index] != search

    end

    # Failsafe if we didn't find it
    return -1

  end

end
