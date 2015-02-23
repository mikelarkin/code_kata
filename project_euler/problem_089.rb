module Problem089


#Roman numerals
#
# The rules for writing Roman numerals allow for many ways of writing each number (see About Roman Numerals...).
# However, there is always a "best" way of writing a particular number.
#
# For example, the following represent all of the legitimate ways of writing the number sixteen:
#
# IIIIIIIIIIIIIIII
# VIIIIIIIIIII
# VVIIIIII
# XIIIIII
# VVVI
# XVI
#
# The last example being considered the most efficient, as it uses the least number of numerals.
#
# The 11K text file, roman.txt (right click and 'Save Link/Target As...'), contains one thousand numbers written in valid,
# but not necessarily minimal, Roman numerals; that is, they are arranged in descending units and obey the subtractive pair rule
# (see About Roman Numerals... for the definitive rules for this problem).
#
# Find the number of characters saved by writing each of these in their minimal form.
#
# Note: You can assume that all the Roman numerals in the file contain no more than four consecutive identical units.
#
# Written by http://github.com/mikelarkin


# This function takes in a "valid" roman numeral string and
# shrinks it down to the most efficient version
  def self.minimize(number)
    return ""
  end


# Load the file into an array
  numbers = Array.new()
  savings = 0


# Example 2 - Pass file to block
  File.open(File.dirname(__FILE__) + "/resources/roman.txt", "r") do |infile|
    while (line = infile.gets)
      #line = line.gsub("\"", "").gsub(" ", "")
      numbers << line
    end
  end

  numbers.each do |number|
    savings += number.size - self.minimize(number).size
  end

  puts "#{savings} numerals were saved."
end