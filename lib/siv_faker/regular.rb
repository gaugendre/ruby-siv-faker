module SivFaker
  class Regular
    extend Base

    class << self
      def generate(recent: false)
        [
          rand_left_sequence(recent: recent),
          rand_number_sequence,
          rand_right_sequence
        ].join("-")
      end
    end
  end
end
