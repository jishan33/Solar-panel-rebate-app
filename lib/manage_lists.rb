
class Manage_list
attr_reader :eligible_list
@@processing_number = 0
  def initialize(list_name)
    @list_name = list_name
    @eligible_list = []
  end
  def self.display_processing_number
    @@processing_number
  end
  def remove_applicant(name)
    @eligible_list.delete(name)
    @@processing_number -= 1
  end

  def add_to_eligible_list(name)
    @eligible_list << name
    @@processing_number += 1
  end
end