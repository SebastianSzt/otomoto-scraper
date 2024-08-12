require 'wicked_pdf'
require 'erb'

class PDFGenerator
  TEMPLATE_PATH = 'lib/templates/report.html.erb'
  CSS_PATH = 'lib/templates/styles.css'

  def initialize(filename, cars)
    @filename = filename
    @cars = cars
  end

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

  def generate_html
    template = File.read(TEMPLATE_PATH)
    ERB.new(template).result(binding)
  end
end
