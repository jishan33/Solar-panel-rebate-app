require 'uri'
require 'csv'
require 'colorize'
require 'table_print'


class Provided_files_check
  def initialize(name)
    @name = name
  end
  
  def income_proof
    puts "provide the proof of income document URL (only .pdf or .doc): ".colorize(:light_blue)
    url = gets.chomp
    if url =~ URI::regexp
    else 
      puts "It's not a valid file URL."
    end

    file_type = File.extname(URI.parse(url).path)
    if file_type == ".pdf" || file_type == ".doc"
      puts "File upload succeeded." 
      two_forms_of_identity
    else 
      puts "upload failed. please provide .pdf or .doc document."
    end
  end

  def two_forms_of_identity
    file_arr = []
    loop do
      puts "provide identity documents' URL (only .pdf or .doc): "
      url = gets.chomp
      if url =~ URI::regexp
        puts "valid file URL."
      else 
        puts "It's not a valid file URL."
      end

      file_type = File.extname(URI.parse(url).path)
      if file_type == ".pdf" || file_type == ".doc"
        file_arr << file_type
        puts "file upload succeeded." 
      else 
      puts "upload failed. please provide .pdf or .doc document."
      end
    break if file_arr.size == 2
    end
    retailer_quote
  end

  def retailer_quote
    puts "Provide the eligible quote URL (only .pdf or .doc): "
    url = gets.chomp
    file_type = File.extname(URI.parse(url).path)
        
      if url =~ URI::regexp  
      else 
        puts "It's not a valid file URL."
      end

      if file_type == ".pdf" || file_type == ".doc"
        puts "file upload succeeded." 
        eligible_quote(url)
      else 
        puts "upload failed. please provide .pdf or .doc document."
      end
  end    
  def eligible_quote(url)
    retailer = URI.parse(url).host
    csv_text = File.read('cec_approved_retailers.csv')
    csv = CSV.parse(csv_text, headers: true)
    
      result = csv.find do |web|
      web_address = web.to_hash
      retailer == web_address['URL']
      end 

      if result != nil
        puts "Eligible retailer."
      else
        puts "Not Eligible retailer. Please check the provided list of CEC  approved retailers below"
        tp csv.map { |row| row.to_hash }, {:NAME => {display_name: "Company Name"}}, {:URL => {width: 35}}
     end
  end    
end
