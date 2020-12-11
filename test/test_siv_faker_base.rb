require "minitest/autorun"
require_relative "../lib/siv_faker"

class TestSivFakerBase < Minitest::Test
  # def get_seed_for_sequence(search)
  #   seed = 0
  #   seq = ""
  #   while seq != search
  #     Kernel.srand(seed)
  #     seq = Class.new { extend SivFaker::Base }.rand_letter_sequence
  #     puts "#{seed}: #{seq}"
  #     seed += 1
  #   end
  #   seed - 1
  # end
  RAND1 = 790 # produce "SS"
  RAND2 = 148 # produce "WW"

  def setup
    @tester = Class.new { extend SivFaker::Base }
  end

  def test_letters
    letter_arrays = [
      SivFaker::Base::LETTERS,
      SivFaker::Base::UNREADABLE_LETTERS,
      SivFaker::Base::READABLE_LETTERS,
      SivFaker::Base::RECENT_LETTERS_LEFT.keys
    ]
    
    letter_arrays += SivFaker::Base::RECENT_LETTERS_LEFT.values

    sequence_arrays = [ 
      SivFaker::Base::RECENT_SEQUENCES_LEFT,
      SivFaker::Base::FORBIDDEN_SEQUENCES_LEFT,
      SivFaker::Base::FORBIDDEN_SEQUENCES_RIGHT,
      SivFaker::Base::RECENT_SEQUENCES_LEFT
    ]

    # unique values
    (letter_arrays + sequence_arrays).each do |ary|
      assert_equal ary, ary.uniq
    end

    # all caps values
    (letter_arrays + sequence_arrays).each do |ary|
      assert_equal ary, ary.map(&:upcase)
    end

    # all base sequences are made of two letters
    sequence_arrays.each do |seq|
      assert_equal [2], seq.map(&:size).uniq
    end
  end

  def test_readable_letters
    SivFaker::Base::UNREADABLE_LETTERS.each do |unreadable_letter|
      refute_includes SivFaker::Base::READABLE_LETTERS, unreadable_letter
    end
  end

  def test_rand_number_sequence
    Kernel.srand(1)
    assert_equal @tester.rand_number_sequence, "047"

    Kernel.srand(2)
    assert_equal @tester.rand_number_sequence, "178"
  end

  def test_rand_letter_sequence
    assert_equal 2, @tester.rand_letter_sequence.size

    Kernel.srand(RAND1)
    assert_equal "SS", @tester.rand_letter_sequence

    Kernel.srand(RAND2)
    assert_equal "WW", @tester.rand_letter_sequence
  end

  def test_rand_left_sequence
    # "SS" and "WW" are forbidden on the left sequence
    Kernel.srand(RAND1)
    refute_equal "SS", @tester.rand_left_sequence
    refute_equal "SS", @tester.rand_left_sequence(recent: true)

    Kernel.srand(RAND2)
    refute_equal "WW", @tester.rand_left_sequence
    refute_equal "WW", @tester.rand_left_sequence(recent: true)
  end

  def test_rand_right_sequence
    # "SS" is forbidden on the left sequence
    Kernel.srand(RAND1)
    refute_equal "SS", @tester.rand_right_sequence

    # "WW" is authorized on the right sequence
    Kernel.srand(RAND2)
    assert_equal "WW", @tester.rand_right_sequence
  end
end
