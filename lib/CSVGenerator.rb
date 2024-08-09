require 'csv'

class CarCSVWriter
  def initialize(filename)
    @filename = filename
  end

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
