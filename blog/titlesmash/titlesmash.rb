titles = []
title_mashups_count = 0
line_count = 0
# Load titles from the file
File.open("dvd_titles.csv", "r") do |infile|
  while (line = infile.gets)
    line.gsub!(/\"/,'')
    titles << line
    line_count += 1
  end
end

# titles = ["Beauty", "\"American Beauty\"", "Beauty and \"the Beast\"", "American Pie", "The Fisher King", "An American Tail", "The Sixth Sense", "Sense and Sensibility", "The One", "One Flew Over the Cuckoos Nest", "Robot and Frank", "I, Robot"]
# titles.each do |title|
#   title.gsub!(/\"/,'')
#   line_count += 1
# end

titles.each do |first_title|

  # Create an array of individual words
  first_word = first_title.split(" ")

  # Skip single word titles
  next if first_word.size == 1

  # Sanitize everything but numbers and letters to improve matching
  first_word = first_word.first.gsub(/[^0-9a-z]/i, '')

  titles.each do |last_title|
    next if first_title == last_title # Can't pair with itself

    # Create an array of individual words
    last_word = last_title.split(" ")

    # Skip single word titles
    next if last_word.size == 1

    # Sanitize everything but numbers and letters to improve matching
    last_word = last_word.last.gsub(/[^0-9a-z]/i, '')

    # puts "First: #{first}, Last: #{last}"
    if first_word == last_word
      puts [last_title[/(.*) /,1], first_title].compact.join(" ")
      title_mashups_count += 1
    end
  end
end

puts "======================================"
puts "Found #{title_mashups_count} mashups from #{line_count} movie titles."
