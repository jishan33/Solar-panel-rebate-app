require_relative '../lib/rebate_calculator'

RSpec.describe Rebate_calculator, "#rebate" do
  it "calculates rebate correctly based on area code, kw & deeming years" do
    rebate_calculator = Rebate_calculator.new
    rebate_calculator.stc_postcode_rating(3163)
    rebate_calculator.stc_calculator(2, 5)
    rebate_amount = rebate_calculator.rebate

    expect(rebate_amount).to eq(412.5)
  end
end