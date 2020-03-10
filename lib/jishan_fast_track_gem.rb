# require "jishan_fast_track_gem/version"
require 'uri'
require 'csv'



class Solar_panel_rebate_egilibility_check
  def initialize(name)
    @name = name
  end

  def ower_of_the_property
    puts "Are you the property owner and the current occupier?"
    puts "1. yes"
    puts "2. no"
    answer = gets.chomp.to_i
    if answer == 1
      puts "check the next question."
      received_solar_rebate_before
    elsif answer == 2
      puts "sorry, your are not eligible."
    else
      puts "no valid input."
    end
  end
  
  def received_solar_rebate_before
    puts "Have you received solar panel rebate before?"
    puts "1. yes"
    puts "2. no"
    answer = gets.chomp.to_i
    if answer == 1
      puts "sorry, your are not eligible."
    elsif answer == 2
      puts "check the next question."
      existed_solar_panel
    else
      puts "no valid input."
    end
  end
  def existed_solar_panel
    puts "Do you have an existed solar panel?"
    puts "1. yes"
    puts "2. no"
    answer = gets.chomp.to_i
    if answer == 1
      puts "sorry, your are not eligible."
    elsif answer == 2
      puts "check the next question."
      combined_houshold_income
    else
      puts "no valid input."
    end
  end
  def combined_houshold_income
   puts "Is your household income below $180,000aud ?"
    puts "1. yes"
    puts "2. no"
    answer = gets.chomp.to_i
    if answer == 1
      puts "check the next question."
      property_value
    elsif answer == 2
      puts "sorry, your are not eligible."
    else
      puts "no valid input."
    end
  end
  def property_value
    puts "Is your property value more than $3 millions ?" 
    puts "1. yes"
    puts "2. no"
    answer = gets.chomp.to_i
    if answer == 1
      puts "sorry, your are not eligible."
    elsif answer == 2
      puts "congrats! You are eligible for this rebate!"
    else
      puts "no valid input."
    end
  end
end

class Provided_files_check
attr_reader :eligible_list
  def initialize(name)
    @name = name
  end
  def income_proof
    puts "provide the proof of income document URL (only .pdf or .doc): "
    url = gets.chomp
    file_type = File.extname(URI.parse(url).path)
    if file_type == ".pdf" || file_type == ".doc"
      puts "file upload succeeded." 
      two_forms_of_identity
    else 
      puts "upload failed. please provide valid URL to .pdf or .doc ."
    end
  end

  def two_forms_of_identity
    file_arr = []
    loop do
      puts "provide identity documents' URL (only .pdf or .doc): "
      url = gets.chomp
      file_type = File.extname(URI.parse(url).path)
      if file_type == ".pdf" || file_type == ".doc"
        file_arr << file_type
        puts "file upload succeeded." 
      else 
        puts "upload failed. please provide valid URL to .pdf or .doc ."
      end
      p file_arr
    break if file_arr.size == 2
    end
    eligible_quote
  end

  def retailer_quote
    puts "Provide the eligible quote URL (only .pdf or .doc): "
    url = gets.chomp
    file_type = File.extname(URI.parse(url).path)

      if file_type == ".pdf" || file_type == ".doc"
        puts "file upload succeeded." 
        eligible_quote(url)
      else 
        puts "upload failed. please provide valid URL to .pdf or .doc ."
      end
  end    
  def eligible_quote(url)
    eligible_list = []
    retailer = URI.parse(url).host
    csv_text = File.read('cec_approved_retailers.csv')
    csv = CSV.parse(csv_text, headers: true)
    
      result = csv.find do |web|
      web_address = web.to_hash
      retailer == web_address['URL']
      end 

      if result != nil
        puts "Eligible retailer."
        eligible_list << @name
        p eligible_list
      else
        puts "Not Eligible retailer."  
     end
  end

  def remove_applicant(name)
    @eligible_list.delete(name)
    end
    
end

# ruby = Solar_panel_rebate_egilibility_check.new("Ruby")
# ruby.ower_of_the_property

john_files = Provided_files_check.new("john_files")
# # ruby_files.income_proof
john_files.retailer_quote
# john_files.remove_applicant("john_files")
peta_files= Provided_files_check.new("peta_files")
peta_files.retailer_quote







