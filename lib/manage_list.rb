class ManageList
  attr_reader :list_detail
  @@processing_number = 0
  def initialize(name)
    @name = name
    @list_detail = []
  end

  def self.display_processing_number
    @@processing_number
  end

  def add_applicant(name)
    @list_detail << name
    @@processing_number += 1
  end

  def remove_applicant(name)
    @list_detail.delete(name)
    @@processing_number -= 1
  end
end
