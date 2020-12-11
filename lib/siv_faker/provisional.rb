module SivFaker
  class Provisional
    extend Base

    class << self
      def generate
        [
          "WW",
          rand_number_sequence,
          rand_right_sequence
        ].join("-")
      end
    end
  end
end
