require File.expand_path("../lib/siv_faker/version", __FILE__)

Gem::Specification.new do |spec|
  spec.name = "siv_faker"
  spec.license = "MIT"
  spec.version = SivFaker::VERSION
  spec.authors = ["Guilhem Augendre"]
  spec.email = ["guilhem.augendre@gmail.com"]

  spec.summary = "Easily generate fake data for vehicle license_plate from France"
  spec.description = "Replace Faker::Vehicle.license_plate from Faker gem for french SIV system, is used to easily generate fake french license_plate data."
  spec.homepage = "https://github.com/gaugendre/siv_faker"

  spec.files = Dir["lib/siv_faker.rb", "lib/siv_faker/**/*"]
  spec.test_files = Dir["test/**/*.rb"]

  spec.metadata = {
    "bug_tracker_uri" => "#{spec.homepage}/issues",
    "changelog_uri" => spec.homepage,
    "documentation_uri" => spec.homepage,
    "homepage_uri" => spec.homepage,
    "source_code_uri" => spec.homepage
  }

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "standardrb"
  spec.add_development_dependency "faker"
end
