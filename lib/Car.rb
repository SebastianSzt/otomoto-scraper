# Car represents a car with various attributes.
class Car
# The brand of the car (e.g., "Audi").
  #
  # @return [String] The brand of the car.
  attr_accessor :brand

  # The model of the car (e.g., "A6").
  #
  # @return [String] The model of the car.
  attr_accessor :model

  # The URL of the car's image.
  #
  # @return [String] The URL of the car's image.
  attr_accessor :img

  # The title or name of the car (e.g., "Audi A6 3.0 TDI").
  #
  # @return [String] The title of the car.
  attr_accessor :title

  # The engine capacity of the car (e.g., "3000 cm3").
  #
  # @return [String] The engine capacity of the car.
  attr_accessor :engine_capacity

  # The horsepower of the car (e.g., "245 KM").
  #
  # @return [String] The horsepower of the car.
  attr_accessor :horsepower

  # The mileage of the car (e.g., "150,000 km").
  #
  # @return [String] The mileage of the car.
  attr_accessor :mileage

  # The type of fuel used by the car (e.g., "Diesel").
  #
  # @return [String] The type of fuel used by the car.
  attr_accessor :fuel_type

  # The type of gearbox the car has (e.g., "Automatic").
  #
  # @return [String] The type of gearbox the car has.
  attr_accessor :gearbox

  # The year of production of the car.
  #
  # @return [String] The year of production of the car.
  attr_accessor :year

  # The location where the car is being sold.
  #
  # @return [String] The location where the car is being sold.
  attr_accessor :location

  # The price of the car (e.g., "100,000 PLN").
  #
  # @return [String] The price of the car.
  attr_accessor :price
  
  # Initializes a new Car object with the provided data.
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

  # Displays the car's attributes.
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
