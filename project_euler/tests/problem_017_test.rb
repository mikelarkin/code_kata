require "test/unit"
require "../problem_017"


class TestProblem017 < Test::Unit::TestCase


  def test_number_to_words
    assert_equal("one", Problem017.number_to_words(1))
    assert_equal("eleven", Problem017.number_to_words(11))
    assert_equal("twelve", Problem017.number_to_words(12))
    assert_equal("twenty", Problem017.number_to_words(20))
    assert_equal("sixty", Problem017.number_to_words(60))
    assert_equal("twenty-one", Problem017.number_to_words(21))
    assert_equal("fifty-seven", Problem017.number_to_words(57))
    assert_equal("one hundred", Problem017.number_to_words(100))
    assert_equal("two hundred", Problem017.number_to_words(200))
    assert_equal("one hundred and fifteen", Problem017.number_to_words(115))
    assert_equal("two hundred and six", Problem017.number_to_words(206))
    assert_equal("three hundred and forty-two", Problem017.number_to_words(342))
    assert_equal("five hundred and sixty-six", Problem017.number_to_words(566))
    assert_equal("seven hundred and thirty", Problem017.number_to_words(730))
    assert_equal("nine hundred and ninety-nine", Problem017.number_to_words(999))
    assert_equal("one thousand", Problem017.number_to_words(1000))

  end

  def test_letter_count

    assert_equal(23, Problem017.letter_count(Problem017.number_to_words(342)))
    assert_equal(20, Problem017.letter_count(Problem017.number_to_words(115)))
  end
end
