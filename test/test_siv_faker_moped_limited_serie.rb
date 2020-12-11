require "minitest/autorun"
require_relative "../lib/siv_faker"

class TestSivFakerMopedLimitedSerie < Minitest::Test
  def setup
    @tester = SivFaker::MopedLimitedSerie
  end

  def test_rand_variable_letter_sequence
    seq = @tester.rand_variable_letter_sequence
    assert_equal seq, seq.upcase

    Kernel.srand(0)
    assert_equal @tester.rand_variable_letter_sequence.size, 1

    Kernel.srand(1)
    assert_equal @tester.rand_variable_letter_sequence.size, 2
  end

  def test_rand_number_sequence
    Kernel.srand(1)
    assert_equal @tester.rand_number_sequence, "47"

    Kernel.srand(2)
    assert_equal @tester.rand_number_sequence, "178"
  end
end
