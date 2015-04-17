require "test/unit"
require "../problem_089"


class TestProblem089 < Test::Unit::TestCase


  def test_minimize
    assert_equal("XVI", Problem089.minimize("IIIIIIIIIIIIIIII"))
    assert_equal("XVI", Problem089.minimize("VIIIIIIIIIII"))
    assert_equal("XVI", Problem089.minimize("VVIIIIII"))
    assert_equal("XVI", Problem089.minimize("XIIIIII"))
    assert_equal("XVI", Problem089.minimize("VVVI"))
    assert_equal("XVI", Problem089.minimize("XVI"))
  end
end