require_relative '../lib/rebate_calculator'

RSpec.describe Rebate_calculator, "#rebate" do
  it "calculates rebate correctly based on area code, kw & deeming years" do
    rebate_1 = Rebate_calculator.new(3163, 2, 5)
    rebate_amount = rebate_1.stc_postcode_rating
     

    expect(rebate_amount).to eq(412.5)
  end
end