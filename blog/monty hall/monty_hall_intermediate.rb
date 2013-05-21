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
switch_wins = keep_wins = 0

# Read in number of iterations from command line,
# otherwise default to 500K
iterations = (ARGV.empty? ? 500000 : ARGV[0].to_i)

iterations.times do

  # Hide the car
  car = rand(3)

  # Pick a door
  choice = rand(3)

  # Let's look into the future and see if we want to switch
  switch = rand(2)

  # Only bother to reveal a door if the player is going to switch
  if switch == 1

    # Reveal a "goat" door.  This will be done using some array logic.
    # Basically we are going to take an array of possible doors and subtract out
    # both their initial choice as well as the car's location
    # What is left are viable "goat" doors we can show.

    revealed_goat_door = ([0, 1, 2] - [car] - [choice]).first

    # Choose the other door
    new_choice = ([0, 1, 2] - [revealed_goat_door] - [choice]).first
    # See if the new choice is the winner
    if car == new_choice
      switch_wins += 1
    end
  else
    # See if the player picked correctly from the start
    if car == choice
      keep_wins += 1
    end
  end

end

puts "After #{iterations} iterations, wins from switching: #{((switch_wins.to_f / iterations.to_f) * 100.0).round(2)}%, wins from staying: #{((keep_wins.to_f / iterations.to_f) * 100.0).round(2)}%."