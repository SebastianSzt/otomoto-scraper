require_relative 'lib/Scraper'
require_relative 'lib/Car'
require_relative 'lib/CSVGenerator'

base_url = 'https://www.otomoto.pl/osobowe/audi/a6'
number_of_pages = 2

begin
  scraper = Scraper.new(base_url, number_of_pages)
  cars = scraper.scrape_pages

  cars.each(&:display)

  csv_writer = CarCSVWriter.new('cars.csv')
  csv_writer.write_to_csv(cars)
rescue StandardError => e
  puts "An error occurred: #{e.message}"
end
