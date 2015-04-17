module Problem243
  # A positive fraction whose numerator is less than its denominator is called a proper fraction.
  # For any denominator, d, there will be d−1 proper fractions; for example, with d = 12:
  # 1/12 , 2/12 , 3/12 , 4/12 , 5/12 , 6/12 , 7/12 , 8/12 , 9/12 , 10/12 , 11/12 .

  # We shall call a fraction that cannot be cancelled down a resilient fraction.
  # Furthermore we shall define the resilience of a denominator, R(d), to be the
  # ratio of its proper fractions that are resilient; for example, R(12) = 4/11 .
  # In fact, d = 12 is the smallest denominator having a resilience R(d) < 4/10 .

  # Find the smallest denominator d, having a resilience R(d) < 15499/94744

  def self.is_resilient?(numerator, denominator)

    # Optimizations
    # If both are even, it's not resilient
    return false if denominator.even? && numerator.even?

    # GCD of 1 means it's not reducible
    return numerator.gcd(denominator) == 1

  end

  def self.resilience(denominator)

    count = 0

    1.upto(denominator - 1) { |i|
      if Problem243.is_resilient?(i, denominator)
        count += 1
      end
    }

    return (count.to_f/(denominator - 1).to_f)

  end

end


lower_limit = (ARGV.empty? || ARGV[0].nil? ? 1 : ARGV[0].to_i)
upper_limit = (ARGV.empty? || ARGV[1].nil? ? 100 : ARGV[1].to_i)
threshold = (ARGV.empty? || ARGV[2].nil? ? (15499.0/94744.0) : ARGV[2].to_f)

puts "Looking for R(d) < #{threshold} for denominators between #{lower_limit} and #{upper_limit}"
lower_limit.upto(upper_limit) { |i|

  if Problem243.resilience(i) < threshold
    puts "Smallest resilient denominator: #{i}"
    break
  end
  printf(".")
}

puts "...Complete"
