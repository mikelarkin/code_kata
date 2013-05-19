# Monty Hall Problem
# http://en.wikipedia.org/wiki/Monty_Hall_problem
#
# The Monty Hall problem is a probability puzzle loosely based on the American television
# game show Let's Make a Deal and named after the show's original host, Monty Hall.
# The problem, also called the Monty Hall paradox, is a veridical paradox because the result
# appears impossible but is demonstrably true. The Monty Hall problem, in its usual interpretation,
# is mathematically equivalent to the earlier Three Prisoners problem, and both bear some similarity
# to the much older Bertrand's box paradox.
#
# Suppose you're on a game show, and you're given the choice of three doors: Behind one door is a car;
# behind the others, goats. You pick a door, say No. 1, and the host, who knows what's behind the doors,
# opens another , say No. 3, which has a goat. He then says to you, "Do you want to pick door No. 2?"
#
# Is it to your advantage to switch your choice?


# Setup the game
switch_wins = 0
keep_wins = 0
iterations = (ARGV.empty? ? 500000 : ARGV[0].to_i)

iterations.times do

  # Hide the car
  car = rand(3)

  # Pick a door
  choice = rand(3)

  # Randomly decide to switch or to keep original choice
  switch = rand(2)

  # Only check for win conditions
  if (switch == 1 && car != choice)
    # Picked a goat, then switched
    switch_wins += 1 
  elsif (switch == 0 && car == choice)
    # Picked the car, and stuck with it
    keep_wins += 1
  end


end

puts "After #{iterations} iterations, wins from switching: #{((switch_wins.to_f / iterations.to_f) * 100.0).round(2)}%, wins from staying: #{((keep_wins.to_f / iterations.to_f) * 100.0).round(2)}%."