require 'csv'

# CSVGenerator is responsible for writing car data to a CSV file.
class CSVGenerator
  # Initializes the CSVGenerator with a filename.
  #
  # @param filename [String] the name of the CSV file to write to.
  def initialize(filename)
    @filename = filename
  end

  # Writes the car data to a CSV file.
  #
  # @param cars [Array<Car>] an array of Car objects to write to the CSV file.
  def write_to_csv(cars)
    CSV.open(@filename, 'w') do |csv|
      csv << ['Brand', 'Model', 'Image', 'Title', 'Engine Capacity', 'Horsepower', 'Mileage', 'Fuel Type', 'Gearbox', 'Year', 'Location', 'Price']
      cars.each do |car|
        csv << [
          car.brand,
          car.model,
          car.img,
          car.title,
          car.engine_capacity,
          car.horsepower,
          car.mileage,
          car.fuel_type,
          car.gearbox,
          car.year,
          car.location,
          car.price
        ]
      end
    end
  end
end
