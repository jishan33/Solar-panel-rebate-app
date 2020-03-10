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
        puts "Not Eligible retailer."  
     end
  end    
end

class Manage_list
attr_reader :eligible_list
@@processing_number = 0
  def initialize(list_name)
    @list_name = list_name
    @eligible_list = []
  end
  def self.display_processing_number
    @@processing_number
  end
  def remove_applicant(name)
    @eligible_list.delete(name)
    @@processing_number -= 1
  end

  def add_to_eligible_list(name)
    @eligible_list << name
    @@processing_number += 1
  end
end


class Rebate_calculator
  def initialize(name)
    @name = name
    @stc_rating = 0
    @stc = 0
  end
  def stc_postcode_rating(postcode)
    csv_text = File.read('stc_rating.csv')
    csv = CSV.parse(csv_text, headers: true)
    result = csv.find do |num|
    stc_table = num.to_hash
    postcode >= stc_table['Postcode from'].to_i && postcode <= stc_table['Postcode to'].to_i
    end
    @stc_rating = result['Rating'].to_f
  end

  def stc_calculator(kw, deeming_year)
    @stc = kw * @stc_rating * deeming_year
  end

  def rebate
  stc_value = 37.5
  rebate_amount = @stc * stc_value
  rebate_amount > 1888 ? 1888 : rebate_amount
  # https://www.tradeingreen.com.au/prices-93.html
  end
end


# ruby = Solar_panel_rebate_egilibility_check.new("Ruby")
# ruby.ower_of_the_property

# john_files = Provided_files_check.new("john_files")
# # ruby_files.income_proof
# john_files.retailer_quote
# john_files.remove_applicant("john_files")
# peta_files= Provided_files_check.new("peta_files")
# peta_files.retailer_quote


# a_list = Manage_list.new("a_list")
# a_list.add_to_eligible_list("John")
# a_list.add_to_eligible_list("Peta")
# a_list.remove_applicant("John")
# p Manage_list.display_processing_number
# p a_list.eligible_list

john_rebate = Rebate_calculator.new("John_rebate")
john_rebate.stc_postcode_rating(3163)
john_rebate.stc_calculator(3, 15)
p john_rebate.rebate











