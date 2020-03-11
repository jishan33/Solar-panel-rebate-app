require_relative '../lib/manage_lists'

RSpec.describe Manage_list, "#C.U.R.D" do 
it "manage the number of lists and the applicants in lists." do
  list_a = Manage_list.new
  list_a.add_to_eligible_list("John")
  list_a.add_to_eligible_list("Ptal")
  list_a.remove_applicant("Ptal")
  Manage_list.display_processing_number

  expect(list_a.eligible_list).to eq(["John"])
  expect(Manage_list.display_processing_number).to eq(1)

  end
end
