# Monty Hall Problem
# http://en.wikipedia.org/wiki/Monty_Hall_problem
#
# This is a variation on the Monty Hall problem with a variable number of doors.
require 'pp'

# Setup the game
switch_wins = 0
keep_wins = 0
max_doors = (ARGV.empty? ? 10 : ARGV[0].to_i)
iterations = 100000 
results = []

3.upto(max_doors) { |doors|
  switch_wins = 0
  keep_wins = 0

  iterations.times do

    # Hide the car
    car = rand(doors)

    # Pick a door
    choice = rand(doors)

    # Randomly decide to switch or to keep original choice
    switch = rand(2)

    # Only check for win conditions
    if (switch == 0 && choice == car)
      # Picked a goat, then switched
      keep_wins += 1
    elsif (switch == 1 && choice != car)

      # Decided to switch and they didn't originally pick the
      # car, so now they have a chance to win

      # We have to reveal a "bad" door that is not the car and is not their choice
      revealed_door = rand(doors)
      while revealed_door == car || revealed_door == choice
        revealed_door = rand(doors)
      end

      # Pick a new door that is not the revealed door and is not the originally picked door
      new_door = rand(doors)
      while new_door == revealed_door || new_door == choice
        new_door = rand(doors)
      end


      if new_door == car
        switch_wins += 1
      end
    end


  end

  results[doors] = [doors, ((switch_wins.to_f / iterations.to_f) * 100.0).round(4),((keep_wins.to_f / iterations.to_f) * 100.0).round(4)]
  #results.merge!(doors => [((switch_wins.to_f / iterations.to_f) * 100.0).round(4),((keep_wins.to_f / iterations.to_f) * 100.0).round(4)])

}
results.compact!

puts "#{iterations} iterations each time."

results.each do |result|
  puts result.join(",")
end

#puts "After #{iterations} iterations, wins from switching: #{((switch_wins.to_f / iterations.to_f) * 100.0).round(4)}%, wins from staying: #{((keep_wins.to_f / iterations.to_f) * 100.0).round(4)}%."