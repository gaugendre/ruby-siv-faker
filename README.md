# Faker's french license plates

Generate relevant pseudo-random vehicle license plates using the french format.

This gem is a standalone addition to the license plate generator `Faker::Vehicle.license_plate` from the gem [faker](https://rubygems.org/gems/faker) for french plate system or "[SIV](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_France#SIV)".

## Installing

```ruby
gem "siv_faker", git: "https://github.com/gaugendre/siv_faker.git", branch: "main"
```

## Usage

### with faker

```ruby
require "faker"
require "siv_faker"

# from faker
Faker::Vehicle.license_plate # => "DEP-2483"
Faker::Vehicle.singapore_license_plate #=> "SLV1854M"

# from this gem
Faker::Vehicle.french_license_plate # => "TZ-930-JD"

# the first two letters correspond to a recent period
# ~betwen 2017 and 2019
Faker::Vehicle.french_license_plate(recent: true) # => "AF-572-UY"
```

### standalone syntax

```ruby
require "siv_faker"

# the first two letters are pseudo random
SivFaker::Vehicle.licence_plate # => "TZ-930-JD"

# the first two letters correspond to a recent period
# ~betwen 2017 and 2019
SivFaker::Vehicle.recent_licence_plate # => "DM-930-ZT"

# special cases
SivFaker::Vehicle.provisional_licence_plate # => "W-912-GG"
SivFaker::Vehicle.workshop_licence_plate # => "WW-707-AG"
SivFaker::Vehicle.moped_licence_plate # => "BJ 79 Y"
```

## Resources

* [faker](https://github.com/faker-ruby/faker) gem and other fake data for the [vehicle](https://github.com/faker-ruby/faker/blob/master/doc/default/vehicle.md)
* [Wikipedia](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_France)
* [plaque.free.fr](http://plaque.free.fr/)
