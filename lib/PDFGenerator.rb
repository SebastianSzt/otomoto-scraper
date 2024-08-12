require 'wicked_pdf'
require 'erb'

# PDFGenerator is responsible for generating a PDF report of car data.
class PDFGenerator
  # Path to the HTML template file used for generating the PDF content.
  TEMPLATE_PATH = 'lib/templates/report.html.erb'
  # Path to the CSS file that styles the HTML content in the PDF.
  CSS_PATH = 'lib/templates/styles.css'

  # Initializes the PDFGenerator with a filename and car data.
  #
  # @param filename [String] the name of the PDF file to generate.
  # @param cars [Array<Car>] an array of Car objects to include in the PDF.
  def initialize(filename, cars)
    @filename = filename
    @cars = cars
  end

  # Generates the PDF report.
  def generate_pdf
    html_content = generate_html
    pdf_content = WickedPdf.new.pdf_from_string(
      html_content,
      encoding: 'UTF-8'
    )
    File.open(@filename, 'wb') do |file|
      file << pdf_content
    end
  end

  private

  # Generates the HTML content for the PDF.
  #
  # @return [String] the HTML content.
  def generate_html
    template = File.read(TEMPLATE_PATH)
    ERB.new(template).result(binding)
  end
end
