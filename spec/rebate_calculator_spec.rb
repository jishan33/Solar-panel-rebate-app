require_relative '../lib/rebate_calculator'

RSpec.describe Rebate_calculator, "#rebate" do
  it "calculates rebate correctly based on area code, kw & deeming years" do
    rebate_1 = Rebate_calculator.new
    rebate_amount = rebate_1.ask_parameters
    # 3163, 5kw, 5 years
    expect(rebate_amount).to eq(1087.5)
  end
end