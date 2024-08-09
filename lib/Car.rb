class Car
  attr_accessor :brand, :model, :img, :title, :engine_capacity, :horsepower, :mileage, :fuel_type, :gearbox, :year, :location, :price

  def initialize(car_data)
    @brand = car_data[:brand]
    @model = car_data[:model]
    @img = car_data[:img]
    @title = car_data[:title]
    @engine_capacity = car_data[:engine_capacity]
    @horsepower = car_data[:horsepower]
    @mileage = car_data[:mileage]
    @fuel_type = car_data[:fuel_type]
    @gearbox = car_data[:gearbox]
    @year = car_data[:year]
    @location = car_data[:location]
    @price = car_data[:price]
  end

  def display
    puts "Car brand: #{@brand}"
    puts "Car model: #{@model}" if @model
    puts "Car image: #{@img}"
    puts "Car title: #{@title}"
    puts "Car engine capacity: #{@engine_capacity}" if @engine_capacity
    puts "Car horsepower: #{@horsepower}" if @horsepower
    puts "Car mileage: #{@mileage}"
    puts "Car fuel type: #{@fuel_type}"
    puts "Car gearbox: #{@gearbox}"
    puts "Car year: #{@year}"
    puts "Car location: #{@location}"
    puts "Car price: #{@price}"
    puts '#' * 40
  end
end
