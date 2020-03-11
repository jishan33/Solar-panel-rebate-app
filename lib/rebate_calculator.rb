require 'csv'

class Rebate_calculator
  def initialize
    @stc_rating = 0
    @stc = 0
  end

  def stc_postcode_rating(postcode)
    csv_text = File.read(__dir__ + '/stc_rating.csv')
    csv = CSV.parse(csv_text, headers: true)
    result = csv.find do |num|
    stc_table = num.to_hash
    postcode >= stc_table['Postcode from'].to_i && postcode <= stc_table['Postcode to'].to_i
    end
    @stc_rating = result['Rating'].to_f
  end

  def stc_calculator(kw, deeming_year)
    @stc = (kw * @stc_rating * deeming_year).floor
  end

  def rebate
  stc_value = 37.5
  rebate_amount = @stc * stc_value
  rebate_amount > 1888 ? 1888 : rebate_amount
  end
end