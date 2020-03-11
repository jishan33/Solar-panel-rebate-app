# require "jishan_fast_track_gem/version"
require_relative 'rebate_calculator'
require_relative 'files_check'
require_relative 'eligibility_check'
require_relative 'manage_lists'

#  write the intro
# Help file includes *comprehensive* instructions which *accurately* describe: steps to install the application; dependencies required by the application; system/hardware requirements; features of the application.

john = Solar_panel_rebate_egilibility_check.new
# john.ower_of_the_property
john_files = Provided_files_check.new
john_files.income_proof

# list_zone_1 = Manage_list.new
# list_zone_2 = Manage_list.new

# list_zone_1.add_applicant("John")
# list_zone_1.add_applicant("Sab")

# list_zone_2.add_applicant("Peppy")
# list_zone_2.add_applicant("sup")
# list_zone_2.remove_applicant("Peppy")

# p list_zone_1.list_detail
# p list_zone_2.list_detail

# p Manage_list.display_processing_number












