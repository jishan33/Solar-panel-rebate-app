require "uri"
require "csv"
require "colorize"
require "table_print"

class Provided_files_check
  def initialize
  end

  def income_proof
    puts "provide the proof of income document URL (only .pdf or .doc): ".colorize(:light_blue)
    puts "if you wish to leave this file check process, type 0 ".colorize(:green)

    url = gets.chomp
    return income_proof unless valid_file_check(url)
    return income_proof unless file_type_check(url)
    two_forms_of_identity
  end

  def two_forms_of_identity
    file_arr = []
    loop do
      puts "provide identity documents' URL in total two (only .pdf or .doc): ".colorize(:light_blue)
      puts "if you wish to leave this file check process, type 0 ".colorize(:green)
      url = gets.chomp
      return two_forms_of_identity unless valid_file_check(url)
      return two_forms_of_identity unless file_type_check(url)
      file_arr << url
      break if file_arr.size == 2
    end
    retailer_quote
  end



  def retailer_quote
    puts "Provide the eligible quote URL (only .pdf or .doc): ".colorize(:light_blue)
    puts "if you wish to leave this file check process, type 0 ".colorize(:green)

    url = gets.chomp
    file_type = File.extname(URI.parse(url).path)
    return retail quote unless valid_file_check(url)
    return retail quote unless file_type_check(url)
    eligible_quote(url)
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
      puts "Eligible retailer.".colorize(:red)
    else
      puts "Not Eligible retailer. Please check the provided list of CEC  approved retailers below, wish to hear back from you soon.".colorize(:light_yellow)
      tp csv.map { |row| row.to_hash }, { :NAME => { display_name: "Company Name" } }, { :URL => { width: 35 } }
    end
  end
  
  def valid_file_check(url)
  loop do
    if url =~ URI::regexp
      puts "It's a valid URL."
      return true
    elsif url == "0"
      exit
    else
      puts "It's not a valid file URL.".colorize(:light_yellow)
      return false
    end
  break if url == "0" || url =~ URI::regexp 
  end
  end
  def file_type_check(url)
  loop do
    file_type = File.extname(URI.parse(url).path)
    if file_type == ".pdf" || file_type == ".doc"
      puts "File upload succeeded.".colorize(:red)
      return true
    else
      puts "Upload failed, please provide .pdf or .doc document.".colorize(:light_yellow)
      return false
    end
  break if file_type == ".pdf" || file_type == ".doc"
  end
  end
end
