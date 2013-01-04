class Notification < ActiveRecord::Base
  belongs_to :table
  attr_accessible :note, :status

  def mark_as_done()
    self.update_attributes(:status => true)
  end

  def is_done?
    status == true
  end
end
