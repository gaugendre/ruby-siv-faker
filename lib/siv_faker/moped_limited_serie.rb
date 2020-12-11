module SivFaker
  class MopedLimitedSerie
    extend Base

    class << self
      def generate
        [
          rand_variable_letter_sequence,
          rand_number_sequence,
          READABLE_LETTERS.sample
        ].join(" ")
      end

      # since the moped system is deprecated
      # two-letters sequences only begin with A to H
      def rand_variable_letter_sequence
        (rand(1..2) == 2 ? Array("A".."H").sample : "") + READABLE_LETTERS.sample
      end

      def rand_number_sequence
        rand(10..999).to_s
      end
    end
  end
end
