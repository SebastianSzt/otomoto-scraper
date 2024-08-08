require 'nokogiri'
require 'open-uri'

base_url = 'https://www.otomoto.pl/osobowe/audi/a6?page='
page = 1

brand = nil
model = nil

while page <= 4
  puts "Page: #{page}"
  url = "#{base_url}#{page}"
  html_content = URI.open(url)
  doc = Nokogiri::HTML(html_content)

  if page == 1
    filter_info = doc.xpath('//div[@data-testid="applied-filters"]//button').map(&:text)

    if filter_info.length <= 1
      puts 'No cars found'
      exit
    end

    brand = filter_info[0]
    model = filter_info[1] if filter_info.length > 1

    puts "Brand: #{brand}"
    puts "Model: #{model}" if model
    puts '#' * 40
  end

  cars = doc.xpath('//div[@data-testid="search-results"]//div//article/section')

  cars.each_with_index do |car, index|
    car_img = car.xpath('.//div[1]//img[1]').attr('src')
    car_title = car.xpath('.//div[2]//h1//a').text
    car_info = car.xpath('.//div[2]//p').text.split(' • ')
    car_engine_capacity = car_info.first if car_info.first.include?('cm3')
    car_horsepower = car_info[1] if car_info.length > 1 && car_info[1].include?('KM')
    car_mileage = car.xpath('.//dd[@data-parameter="mileage"]').text
    car_fuel_type = car.xpath('.//dd[@data-parameter="fuel_type"]').text
    car_gearbox = car.xpath('.//dd[@data-parameter="gearbox"]').text
    car_year = car.xpath('.//dd[@data-parameter="year"]').text
    car_location = car.xpath('.//div[3]//dl[2]//dd[1]//p').text
    car_price = car.at_xpath('.//div[4]//div[2]//div//h3')&.text&.concat(' PLN')

    puts "Car image: #{car_img}"
    puts "Car title: #{car_title}"
    puts "Car engine capacity: #{car_engine_capacity}" if car_engine_capacity
    puts "Car horsepower: #{car_horsepower}" if car_horsepower
    puts "Car mileage: #{car_mileage}"
    puts "Car fuel type: #{car_fuel_type}"
    puts "Car gearbox: #{car_gearbox}"
    puts "Car year: #{car_year}"
    puts "Car location: #{car_location}"
    puts "Car price: #{car_price}"

    puts '#' * 40

    break if index == 1
  end

  next_page_disabled = doc.xpath('//li[@title="Next Page"]').attr('aria-disabled')

  break if next_page_disabled

  page += 1
end
