require "test/unit"
require "./implementation_one"


class TestImplementationOne < Test::Unit::TestCase


  def test_chop
    assert_equal(-1, ImplementationOne.chop(3, []))
    assert_equal(-1, ImplementationOne.chop(3, [1]))
    assert_equal(0, ImplementationOne.chop(1, [1]))
    #
    assert_equal(0, ImplementationOne.chop(1, [1, 3, 5]))
    assert_equal(1, ImplementationOne.chop(3, [1, 3, 5]))
    assert_equal(2, ImplementationOne.chop(5, [1, 3, 5]))
    assert_equal(-1, ImplementationOne.chop(0, [1, 3, 5]))
    assert_equal(-1, ImplementationOne.chop(2, [1, 3, 5]))
    assert_equal(-1, ImplementationOne.chop(4, [1, 3, 5]))
    assert_equal(-1, ImplementationOne.chop(6, [1, 3, 5]))
    #
    assert_equal(0, ImplementationOne.chop(1, [1, 3, 5, 7]))
    assert_equal(1, ImplementationOne.chop(3, [1, 3, 5, 7]))
    assert_equal(2, ImplementationOne.chop(5, [1, 3, 5, 7]))
    assert_equal(3, ImplementationOne.chop(7, [1, 3, 5, 7]))
    assert_equal(-1, ImplementationOne.chop(0, [1, 3, 5, 7]))
    assert_equal(-1, ImplementationOne.chop(2, [1, 3, 5, 7]))
    assert_equal(-1, ImplementationOne.chop(4, [1, 3, 5, 7]))
    assert_equal(-1, ImplementationOne.chop(6, [1, 3, 5, 7]))
    assert_equal(-1, ImplementationOne.chop(8, [1, 3, 5, 7]))
    assert_equal(32, ImplementationOne.chop(33, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]))
  end
end