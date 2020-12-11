module SivFaker
  class Vehicle
    class << self
      def license_plate
        Regular.generate
      end

      def recent_license_plate
        Regular.generate(recent: true)
      end

      def provisional_license_plate
        Provisional.generate
      end

      def workshop_license_plate
        Workshop.generate
      end

      def moped_license_plate
        MopedLimitedSerie.generate
      end
    end
  end
end
