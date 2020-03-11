# require "jishan_fast_track_gem/version"
require_relative 'rebate_calculator'
require_relative 'files_check'
require_relative 'eligibility_check'
require_relative 'manage_lists'

#  write the intro
# Help file includes *comprehensive* instructions which *accurately* describe: steps to install the application; dependencies required by the application; system/hardware requirements; features of the application.

ruby = Solar_panel_rebate_egilibility_check.new("Ruby")
ruby.ower_of_the_property

john_files = Provided_files_check.new("john_files")
# john_files.two_forms_of_identity
john_rebate = Rebate_calculator.new
# john_rebate.stc_postcode_rating(3000)
# john_rebate.stc_calculator(5, 5)
# p john_rebate.rebate

# peta_files= Provided_files_check.new("peta_files")
# peta_files.retailer_quote


# a_list = Manage_list.new
# a_list.add_to_eligible_list("John")
# a_list.add_to_eligible_list("Peta")
# a_list.add_to_eligible_list("Peta")
# a_list.remove_applicant("John")

# p Manage_list.display_processing_number
# p a_list.eligible_list

# john_rebate = Rebate_calculator.new
# john_rebate.stc_postcode_rating(3163)
# john_rebate.stc_calculator(3, 15)
# p john_rebate.rebate







