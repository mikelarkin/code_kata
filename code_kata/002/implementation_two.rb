#Write a binary chop method that takes an integer search target and a sorted array of integers.
# It should return the integer index of the target in the array, or -1 if the target is not in the array.
# The signature will logically be:
#
#   chop(int, array_of_int)  -> int
#
# You can assume that the array has less than 100,000 elements. For the purposes of this Kata, time and memory
# performance are not issues (assuming the chop terminates before you get bored and kill it, and that you
# have enough RAM to run it).


# Implementation One:  Recursive
# Written by http://github.com/mikelarkin

module ImplementationTwo

  def self.chop(search, array)

    # Initial boundary check
    return -1 if array.size == 0


    # Begin the recursive searching process!
    return self.binary_search(search, array, 0, array.size - 1)

  end

  def self.binary_search(search, array, bottom, top)

    # Start in the middle of the range
    index = ((top + bottom) / 2)

    # See if the element is equal (found it), larger, or smaller
    if array[index] == search
      # Yay we found it
      return index
    elsif (top <= bottom) && array[index] != search
      # If we're down to one element, and we haven't found it, then
      # it doesn't exist
      return -1
    elsif array[index] > search
      # Search the bottom half next time
      top = index - 1
    elsif array[index] < search
      # Search the top half next time
      bottom = index + 1
    end

    # Keep on rolling
    return self.binary_search(search, array, bottom, top)

  end

end
