require "uri"
require "csv"
require "colorize"
require "table_print"

class Provided_files_check
  def initialize(name)
    @name = name
  end

  def income_proof
    puts "provide the proof of income document URL (only .pdf or .doc): ".colorize(:light_blue)
    url = gets.chomp
    return unless valid_file_check(url)
    return unless file_type_check(url)
    two_forms_of_identity
  end

  def two_forms_of_identity
    file_arr = []
    loop do
      puts "provide identity documents' URL (only .pdf or .doc): "
      url = gets.chomp
      return unless valid_file_check(url)
      return unless file_type_check(url)
      file_arr << url
      break if file_arr.size == 2
    end
    retailer_quote
  end



  def retailer_quote
    puts "Provide the eligible quote URL (only .pdf or .doc): "
    url = gets.chomp
    file_type = File.extname(URI.parse(url).path)
    return unless valid_file_check(url)
    return unless file_type_check(url)
  end

  def eligible_quote(url)
    retailer = URI.parse(url).host
    csv_text = File.read("cec_approved_retailers.csv")
    csv = CSV.parse(csv_text, headers: true)

    result = csv.find do |web|
      web_address = web.to_hash
      retailer == web_address["URL"]
    end

    if result != nil
      puts "Eligible retailer."
    else
      puts "Not Eligible retailer. Please check the provided list of CEC  approved retailers below"
      tp csv.map { |row| row.to_hash }, { :NAME => { display_name: "Company Name" } }, { :URL => { width: 35 } }
    end
  end
  
  def valid_file_check(url)
    if url =~ URI::regexp
      return true
    else
      puts "It's not a valid file URL."
      return false
    end
  end
  def file_type_check(url)
    file_type = File.extname(URI.parse(url).path)
    if file_type == ".pdf" || file_type == ".doc"
      puts "File upload succeeded."
      return true
    else
      puts "upload failed. please provide .pdf or .doc document."
      return false
    end
  end
end
