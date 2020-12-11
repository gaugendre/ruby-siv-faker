require_relative "siv_faker/base"
require_relative "siv_faker/regular"
require_relative "siv_faker/provisional"
require_relative "siv_faker/workshop"
require_relative "siv_faker/moped_limited_serie"

require_relative "siv_faker/vehicle"
require_relative "faker/vehicle" if defined?(Faker::Vehicle)
