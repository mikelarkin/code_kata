# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first
# names, begin by sorting it
# into alphabetical order. Then working out the alphabetical value for each name,
# multiply this value by its alphabetical position in the list
# to obtain a name score.
#
# For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is
# the 938th name in the
# list. So, COLIN would obtain a score of 938 x 53 = 49714.
#
# What is the total of all the name scores in the file?
#
# Written by http://github.com/mikelarkin


# Figure out the numerical value of the string (A = 1, B = 2, etc)
def alphabetical_value(string)
  value = 0
  string.upcase!
  string.split(//).each do |char|
    value += char.ord - 64
  end
  return value
end


# Load the file into an array
array = Array.new()
total = 0

# Example 2 - Pass file to block
File.open("resources/names.txt", "r") do |infile|
  while (line = infile.gets)
    line = line.gsub("\"", "").gsub(" ", "")
    array << line.split(",")
  end
end

array.flatten!
array.sort!

array.each_with_index do |name, i|
  total += (i+1) * alphabetical_value(name)

end

puts "Total: #{total}"