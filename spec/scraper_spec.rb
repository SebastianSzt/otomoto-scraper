require 'rspec'
require 'nokogiri'
require 'open-uri'
require_relative '../lib/Scraper'

RSpec.describe Scraper do
  let(:base_url) { 'https://www.otomoto.pl/osobowe/audi/a6' }
  let(:number_of_pages) { 1 }
  let(:scraper) { Scraper.new(base_url, number_of_pages) }

  describe '#load_page' do
    it 'loads the current page and parses the HTML document' do
      scraper.load_page
      expect(scraper.instance_variable_get(:@doc)).to be_a(Nokogiri::HTML::Document)
    end
  end

  describe '#initialize' do
    it 'sets the brand to Audi and model to A6' do
      expect(scraper.instance_variable_get(:@brand).strip).to eq('Audi')
      expect(scraper.instance_variable_get(:@model).strip).to eq('A6')
    end

    it 'raises an error if no cars are found for the specified data' do
      allow(scraper).to receive(:load_page).and_return(Nokogiri::HTML('<div></div>'))
      scraper.instance_variable_set(:@doc, Nokogiri::HTML('<div></div>'))
      expect { scraper.check_brand_and_model }.to raise_error('No cars found for this data.')
    end
  end
end
