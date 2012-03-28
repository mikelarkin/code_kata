# The following iterative sequence is defined for the set of positive integers:
#
# n => n/2 (n is even)
# n => 3n + 1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
#
# 13  40  20  10  5  16  8  4  2  1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
#
# NOTE: Once the chain starts the terms are allowed to go above one million.

limit = (ARGV.empty? ? 1000000 : ARGV[0].to_i)

highest_count = result = 0


brute_start_time = Time.now
2.upto(limit) do |number|

  # Reinitialize to 1 (since the starting number counts as a term)
  count = 1

  term = number

  while term != 1
    if term % 2 == 0
      # Even
      term /= 2
    else
      # Odd
      term = (3 * term) + 1
    end
    count += 1
  end

  # Record the highest count
  if count > highest_count
    highest_count = count
    result = number
  end

end

brute_end_time = Time.now

puts "(Brute force time: #{((brute_end_time - brute_start_time) * 1000).to_i}ms) Largest chain is #{highest_count} terms for starting number: #{result}"

highest_count = result = 0
term_table = {}

table_start_time = Time.now
2.upto(limit) do |number|

  count = 1
  term = number

  while term != 1

    # See if this term is in our hash table
    if term_table.has_key?(term)
      # Subtract 1 from the total because we've already counted this term
      count += term_table[term] - 1
      break
    else
      if term % 2 == 0
        # Even
        term /= 2
      else
        # Odd
        term = (3 * term) + 1
      end
      count += 1
    end
  end

  term_table[number] = count

  # Record the highest count
  if count > highest_count
    highest_count = count
    result = number
  end

end

table_end_time = Time.now

puts "(Table time: #{((table_end_time - table_start_time) * 1000).to_i}ms) Largest chain is #{highest_count} terms for starting number: #{result}"