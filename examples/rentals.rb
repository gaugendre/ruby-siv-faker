require "active_support/all"
require "faker"
require_relative "../lib/siv_faker"

def rand_vehicle_status
  [%w[on_road], %w[on_road], %w[on_road],
    %w[on_road available prebooked damaged garage]].sample.sample
end

def rand_vehicle_sub_model
  h = %w[make color transmission drive_type
    fuel_type style car_type].each_with_object({}) { |opt, h|
    h[opt] = Faker::Vehicle.send(opt)
  }

  model = Faker::Vehicle.model(make_of_model: h["make"])

  h["model"] = {
    "brand_name" => h["make"],
    "name" => "#{model} #{h["style"]}"
  }

  h["name"] = "#{h["style"]} #{h["car_type"]}"
  h["model_name"] = "#{h["make"]} #{model}"

  h.delete("make")
  h.delete("style")
  h.delete("car_type")

  h
end

vehicles = []

3.times do |idx|
  vehicle = {}
  vehicle["id"] = idx + 1
  vehicle["plate"] = SivFaker::Vehicle.recent_license_plate

  years = rand(1..4)
  months = rand(12)
  existence_months = (12 * years) + months
  vehicle["manufactured_date"] = existence_months.months.ago.to_date

  montly_mileage = rand(4000..6999)
  vehicle["mileage_km"] = (existence_months * montly_mileage).to_s
  vehicle["mileage_read_at"] = (600 + rand(3600 * 24 * 4)).seconds.ago

  vehicle["status"] = rand_vehicle_status
  vehicle["sub_model"] = rand_vehicle_sub_model

  duration_month = %w[24 36].sample.to_i
  vehicle["current_contract"] = {
    "duration_month" => duration_month.to_s,
    "progress_percentage" => rand(100).to_s,
    "end_date" => rand(duration_month * 30).days.from_now.to_date
  }

  vehicles << vehicle
end

pp vehicles
