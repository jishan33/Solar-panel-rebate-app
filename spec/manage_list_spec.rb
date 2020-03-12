require_relative '../lib/manage_list'

RSpec.describe ManageList, "#C.U.R.D" do
  it "manage the number of lists and the applicants in lists." do
    list_a = ManageList.new("list_a")
    list_a.add_applicant("John")
    list_a.add_applicant("Ptal")
    ManageList.display_processing_number

    expect(list_a.list_detail).to eq(["John", "Ptal"])
    expect(ManageList.display_processing_number).to eq(2)
  end

  it "allows applicants to be removed" do
    list_b = ManageList.new("list_b")
    list_b.add_applicant("John")
    list_b.add_applicant("Ptal")
    list_b.remove_applicant("Ptal")

    ManageList.display_processing_number

    expect(list_b.list_detail).to eq(["John"])
    expect(ManageList.display_processing_number).to eq(3)
  end
end
