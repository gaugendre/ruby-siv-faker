module Faker
  class Vehicle
    class << self
      def french_license_plate(recent: false)
        SivFaker::Regular.generate(recent: recent)
      end
    end
  end
end
