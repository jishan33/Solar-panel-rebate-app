require 'csv'
require 'colorize'


class Rebate_calculator
  def initialize
    @postcode = 0
    @kw = 0
    @deeming_year = 0
    @stc_rating = 0
    @stc = 0
  end

  def instruction
    puts "Hello, this is a rebate calculator. If you don't have the following information with you, this calculator can not evaluate the accurate rebate amount for you. The required information is the postcode, kilowatt and solar panel lifetime. Note. if your response is not in numbers, the rebate amount will always be zero. Also please make sure the provided postcode is accurate. Thank you.".colorize(:light_blue)
    ask_parameters
  end

  private
  def ask_parameters
    loop do
    puts "what is your postcode?"
      postcode = gets.chomp.to_i
      if postcode > 9999
      puts "It's not a valid postcode, please type a valid postcode.".colorize(:light_yellow)
      end
     @postcode = postcode
      if postcode < 9999
        break
      end
    end
    
    puts "How many kilowatt is your future solar panel?"
      kw = gets.chomp.to_i
      @kw = kw
    puts "What is the lifetime of your future solar panel?"
      deeming_year = gets.chomp.to_i
      @deeming_year = deeming_year
    stc_postcode_rating
  end
  private
  def stc_postcode_rating
    csv_text = File.read(__dir__ + '/stc_rating.csv')
    csv = CSV.parse(csv_text, headers: true)
    result = csv.find do |num|
    stc_table = num.to_hash
    @postcode >= stc_table['Postcode from'].to_i && @postcode <= stc_table['Postcode to'].to_i
    end
    @stc_rating = result['Rating'].to_f
    stc_calculator
  end

  def stc_calculator
    @stc = (@kw * @stc_rating * @deeming_year).floor
    rebate
  end

  def rebate
  stc_value = 37.5
  rebate_amount = @stc * stc_value
    if rebate_amount > 1888 
      puts "Total amount of your solar panel rebate has reach the maximum, which is $1888 aud.".colorize(:red)
    else
      puts "Total amount of your solar panel rebate is $#{rebate_amount} aud".colorize(:red)
    end
    rebate_amount
  end
end