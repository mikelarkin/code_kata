module Problem017
  # If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
  #
  # If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
  #
  #
  # NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen)
  # contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
  #
  # Written by http://github.com/mikelarkin

  @numbers = {
    "1" =>  "one",
    "2" => "two",
    "3" => "three",
    "4" => "four",
    "5" => "five",
    "6" => "six",
    "7" => "seven",
    "8" => "eight",
    "9" => "nine",
    "10" => "ten",
    "11" => "eleven",
    "12" => "twelve",
    "13" => "thirteen",
    "14" => "fourteen",
    "15" => "fifteen",
    "16" => "sixteen",
    "17" => "seventeen",
    "18" => "eighteen",
    "19" => "nineteen",
    "20" => "twenty",
    "30" => "thirty",
    "40" => "forty",
    "50" => "fifty",
    "60" => "sixty",
    "70" => "seventy",
    "80" => "eighty",
    "90" => "ninety",
    "100" => "one hundred",
    "200" => "two hundred",
    "300" => "three hundred",
    "400" => "four hundred",
    "500" => "five hundred",
    "600" => "six hundred",
    "700" => "seven hundred",
    "800" => "eight hundred",
    "900" => "nine hundred",
    "1000" => "one thousand"
  }


  # Grab the limit from the console, defaulting to
  # 1000 which is the problem's limit
  limit = (ARGV.empty? ? 1000 : ARGV[0].to_i)

  # Set the upper threshold
  limit = 1000 if limit > 1000

  def self.number_to_words(value)
    if @numbers.has_key?(value.to_i.to_s)
      # See if it's one of our hardcoded values
      return @numbers[value.to_i.to_s]
    elsif value.to_i < 100

      # Otherwise we have to construct it
      # Grab the first digit and append a zero
      # append it to second digit with a hypen
      return "#{number_to_words("#{value.to_s[0]}0".to_i)}-#{number_to_words(value.to_s[1].to_i)}"
    elsif value.to_i < 1000

      # Otherwise we have to construct it
      # Grab the first digit and add "hundred"
      # append it to second and third digits
      return "#{number_to_words("#{value.to_s[0].to_i}")} hundred and #{number_to_words("#{value.to_s[1].to_i}""#{value.to_s[2].to_i}")}"
    end
  end

  def self.letter_count(value)
    # Strip spaces and hyphens
    return value.to_s.gsub(" ", "").gsub("-", "").length
  end

  sum = 0

  1.upto limit do |i|
    sum += letter_count(number_to_words(i))
  end

  puts sum

end
