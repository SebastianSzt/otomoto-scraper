require 'nokogiri'
require 'open-uri'

# Scraper is responsible for scraping car data from a website.
class Scraper
  # Initializes the Scraper with a base URL and number of pages to scrape.
  #
  # @param base_url [String] the base URL of the website to scrape.
  # @param number_of_pages [Integer] the number of pages to scrape.
  def initialize(base_url, number_of_pages)
    @current_page = 1
    raise 'Wrong number of pages' if number_of_pages < 1 || number_of_pages > 4

    @base_url = base_url
    @number_of_pages = number_of_pages
    @doc = load_page
    check_brand_and_model
    @cars = []
  end

  # Loads the current page.
  #
  # @return [Nokogiri::HTML::Document] the parsed HTML document.
  def load_page
    url = "#{@base_url}?page=#{@current_page}"
    html_content = URI.open(url)
    @doc = Nokogiri::HTML(html_content)
  end

  # Checks the brand and model of the cars being scraped.
  #
  # @raise [RuntimeError] if no cars are found for the specified data.
  def check_brand_and_model
    filter_info = @doc.xpath('//div[@data-testid="applied-filters"]//button').map(&:text)
    raise 'No cars found for this data.' if filter_info.empty?

    filter_info.pop

    @brand = filter_info[0].lstrip
    @model = filter_info[1].lstrip if filter_info.length > 1
  end

  # Scrapes the specified number of pages for car data.
  #
  # @return [Array<Car>] an array of Car objects.
  def scrape_pages
    while @current_page <= @number_of_pages
      save_cars

      next_page_disabled = @doc.xpath('//li[@title="Next Page"]').attr('aria-disabled').to_s
      break if next_page_disabled == 'true'

      @current_page += 1
      load_page
    end

    @cars
  end

  # Saves the car data from the current page.
  def save_cars
    cars = @doc.xpath('//div[@data-testid="search-results"]//div//article/section')
    cars.each do |car|
      car_data = {
        brand: @brand,
        model: @model,
        img: car.xpath('.//div[1]//img[1]').attr('src').to_s.split(';').first,
        title: car.xpath('.//div[2]//h1//a').text,
        engine_capacity: car.xpath('.//div[2]//p').text.split(' • ').first,
        horsepower: car.xpath('.//div[2]//p').text.split(' • ')[1],
        mileage: car.xpath('.//dd[@data-parameter="mileage"]').text,
        fuel_type: car.xpath('.//dd[@data-parameter="fuel_type"]').text,
        gearbox: car.xpath('.//dd[@data-parameter="gearbox"]').text,
        year: car.xpath('.//dd[@data-parameter="year"]').text,
        location: car.xpath('.//div[3]//dl[2]//dd[1]//p').text,
        price: "#{car.xpath('.//div[4]//div[2]//div//h3').text} PLN"
      }
      @cars << Car.new(car_data)
    end
  end
end
