require "minitest/autorun"
require_relative "../lib/siv_faker"

class TestSivFakerVehicle < Minitest::Test
  PLATE_MATCH = /[A-Z]{2}-\d{3}-[A-Z]{2}/.freeze
  RECENT_PLATE_MATCH = /(E[K-Z]|F[A-F])-\d{3}-[A-Z]{2}/.freeze
  PROVISIONAL_PLATE_MATCH = /WW-\d{3}-[A-Z]{2}/.freeze
  WORKSHOP_PLATE_MATCH = /W-\d{3}-[A-Z]{2}/.freeze
  MOPED_PLATE_MATCH = /[A-H]?[A-Z] \d{2,3} [A-Z]/.freeze

  def setup
    @tester = SivFaker::Vehicle
  end

  def test_license_plate
    assert_match PLATE_MATCH, @tester.license_plate
  end

  def test_recent_license_plate
    assert_match RECENT_PLATE_MATCH, @tester.recent_license_plate
  end

  def test_provisional_license_plate
    assert_match PROVISIONAL_PLATE_MATCH, @tester.provisional_license_plate
  end

  def test_workshop_license_plate
    assert_match WORKSHOP_PLATE_MATCH, @tester.workshop_license_plate
  end

  def test_moped_license_plate
    assert_match MOPED_PLATE_MATCH, @tester.moped_license_plate
  end
end
