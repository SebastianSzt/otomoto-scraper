require_relative 'lib/Scraper'
require_relative 'lib/Car'
require_relative 'lib/CSVGenerator'
require_relative 'lib/PDFGenerator'

require 'logger'

# Initialize the logger
logger = Logger.new('error.log')

# Main script to scrape car data, display it, and generate CSV and PDF reports.

# The base URL of the website to scrape.
base_url = 'https://www.otomoto.pl/osobowe/audi/a6'

# The number of pages to scrape.
number_of_pages = 2

begin
  # Initialize the scraper with the base URL and number of pages.
  scraper = Scraper.new(base_url, number_of_pages)

  # Scrape the pages and get an array of Car objects.
  cars = scraper.scrape_pages

  # Display each car's attributes.
  cars.each(&:display)

  # Initialize the CSV generator and write the car data to a CSV file.
  csv_writer = CSVGenerator.new('cars.csv')
  csv_writer.write_to_csv(cars)

  # Initialize the PDF generator and generate the PDF report.
  pdf_generator = PDFGenerator.new('cars.pdf', cars)
  pdf_generator.generate_pdf
rescue StandardError => e
  # Handle any errors that occur during the scraping or file generation process.
  puts "An error occurred: #{e.message}"
  logger.error("An error occurred: #{e.message}\n#{e.backtrace.join("\n")}")
end
