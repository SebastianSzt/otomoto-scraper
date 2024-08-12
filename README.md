# web-scraper

This project is a web scraper designed to extract car listings from a specified website. It collects data such as brand, model, engine capacity, and price. The data is then saved into a CSV file and a PDF report.

## Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/SebastianSzt/web-scraper.git
    cd web-scraper
    ```

2. Install the required gems:
    ```sh
    bundle install
    ```

## Usage

1. Modify the `base_url` and `number_of_pages` variables in `main.rb` to specify the desired car's brand and model, as well as the number of pages to scrape.

2. Run the scraper:
    ```sh
    ruby main.rb
    ```

3. The scraped data will be saved in `cars.csv` and `cars.pdf` in the project directory.