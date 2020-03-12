require_relative '../lib/rebate_calculator'

RSpec.describe Rebate_calculator, "#rebate" do
  it "calculates rebate correctly based on area code, kw & deeming years" do
    rebate_1 = Rebate_calculator.new

    # rebate_1.stub(:gets).and_return("3163\n")

    allow(rebate_1).to receive(:gets).and_return("3163\n", "5\n", "5\n")

    rebate_amount = rebate_1.instruction
    # 3163, 5kw, 5 years
    expect(rebate_amount).to eq(1087.5)
  end
end