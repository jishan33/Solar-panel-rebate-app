require 'csv'
require 'colorize'

class Rebate_calculator
  def initialize(postcode, kw, deeming_year)
    @postcode = postcode
    @kw = kw
    @deeming_year = deeming_year
    @stc_rating = 0
    @stc = 0
  end

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
      puts "Total amount of your solar panel rebate has reach the maximun, which is $1888 aud.".colorize(:red)
    else
      puts "Total amount of your solar panel rebate is $#{rebate_amount} aud".colorize(:red)
    end
  end
end