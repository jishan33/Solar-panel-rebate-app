require_relative 'rebate_calculator'
require_relative 'files_check'
require_relative 'eligibility_check'
require_relative 'manage_list'

john = EligibilityCheck.new("John")
john.start_process

john_files = FilesCheck.new("John Files")
john_files.start_process

john_rebate = RebateCalculator.new
john_rebate.start_process



list_zone_1 = ManageList.new("zone 1")
list_zone_2 = ManageList.new("zone 2")

list_zone_1.add_applicant("John")
list_zone_1.add_applicant("Sab")

list_zone_2.add_applicant("Peta")
list_zone_2.add_applicant("sup")
list_zone_2.remove_applicant("Peta")

p list_zone_1.list_detail
p list_zone_2.list_detail
p ManageList.display_processing_number