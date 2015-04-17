require "test/unit"
require "../problem_243"


class TestProblem243 < Test::Unit::TestCase


  def test_is_resilient?
    assert_equal(true, Problem243.is_resilient?(1,2))
    assert_equal(true, Problem243.is_resilient?(300,301))
    assert_equal(true, Problem243.is_resilient?(7,8))
    assert_equal(false, Problem243.is_resilient?(2,2))
    assert_equal(false, Problem243.is_resilient?(3,3))
    assert_equal(false, Problem243.is_resilient?(4,12))
    assert_equal(false, Problem243.is_resilient?(6,12))
    assert_equal(false, Problem243.is_resilient?(12,6))
    assert_equal(true, Problem243.is_resilient?(11,7))
  end

  def test_resilience
    assert_equal((4.0/11.0), Problem243.resilience(12))
  end
end
