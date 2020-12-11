require "minitest/autorun"
require "faker"
require_relative "../lib/siv_faker"

class TestFakerVehicle < Minitest::Test
  PLATE_MATCH = /[A-Z]{2}-\d{3}-[A-Z]{2}/.freeze
  RECENT_PLATE_MATCH = /(E[K-Z]|F[A-F])-\d{3}-[A-Z]{2}/.freeze

  def test_french_license_plate
    assert_match PLATE_MATCH, Faker::Vehicle.french_license_plate
    assert_match RECENT_PLATE_MATCH, Faker::Vehicle.french_license_plate(recent: true)
  end
end
