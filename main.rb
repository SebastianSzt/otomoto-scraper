require_relative 'lib/Scraper'
require_relative 'lib/Car'

base_url = 'https://www.otomoto.pl/osobowe/audi/a6'
number_of_pages = 2

begin
  scraper = Scraper.new(base_url, number_of_pages)
  cars = scraper.scrape_pages

  cars.each(&:display)
rescue StandardError => e
  puts "An error occurred: #{e.message}"
end
