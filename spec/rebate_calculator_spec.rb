require_relative '../lib/rebate_calculator'

RSpec.describe RebateCalculator, "#rebate" do
  it "calculates rebate correctly based on area code, kw & deeming years" do
    rebate_1 = RebateCalculator.new
    postcode = 3163
    kw = 5
    deeming_years = 5

    allow(rebate_1).to receive(:gets).and_return("#{postcode}\n", "#{kw}\n", "#{deeming_years}\n")

    rebate_amount = rebate_1.instruction
    expect(rebate_amount).to eq(1087.5)
  end

  it "calculates rebate for different postcode" do
    rebate_2 = RebateCalculator.new
    postcode = 900
    kw = 5
    deeming_years = 5

    allow(rebate_2).to receive(:gets).and_return("#{postcode}\n", "#{kw}\n", "#{deeming_years}\n")

    rebate_amount = rebate_2.instruction
    expect(rebate_amount).to eq(1425.0)
  end
end
