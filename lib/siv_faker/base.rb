module SivFaker
  module Base
    LETTERS = Array("A".."Z").freeze
    UNREADABLE_LETTERS = %w[O U I].freeze
    READABLE_LETTERS = LETTERS - UNREADABLE_LETTERS

    FORBIDDEN_SEQUENCES_LEFT = ["SS", "WW"].freeze
    FORBIDDEN_SEQUENCES_RIGHT = ["SS"].freeze

    # to simulate relatively recent plate from 2017 to 2019
    # we take sequences from EK to FF
    RECENT_LETTERS_LEFT = {
      "E" => Array("K".."Z") - UNREADABLE_LETTERS,
      "F" => Array("A".."F") - UNREADABLE_LETTERS
    }.freeze

    RECENT_SEQUENCES_LEFT = RECENT_LETTERS_LEFT.each_with_object([]) { |(k, v), a| v.each { |l| a << k + l } }

    def rand_number_sequence
      rand(10..999).to_s.rjust(3, "0")
    end

    def rand_letter_sequence
      [READABLE_LETTERS, READABLE_LETTERS].map(&:sample).join
    end

    def rand_left_sequence(recent: true)
      seq = recent ? RECENT_SEQUENCES_LEFT.sample : rand_letter_sequence
      return rand_left_sequence if FORBIDDEN_SEQUENCES_LEFT.include?(seq)
      seq
    end

    def rand_right_sequence
      seq = rand_letter_sequence
      return rand_right_sequence if FORBIDDEN_SEQUENCES_RIGHT.include?(seq)
      seq
    end
  end
end
