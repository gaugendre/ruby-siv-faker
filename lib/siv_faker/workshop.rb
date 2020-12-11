module SivFaker
  class Workshop
    extend Base

    class << self
      def generate
        [
          "W",
          rand_number_sequence,
          rand_right_sequence
        ].join("-")
      end
    end
  end
end
