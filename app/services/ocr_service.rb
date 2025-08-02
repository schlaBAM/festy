class OcrService
  def scrape_image
    image = RTesseract.new("app/services/fvded_test.webp")

    str = image.to_s
    box = image.to_box

    puts str
    puts "------"
    puts "#{box}"
  end
end
