class Notification < ActiveRecord::Base
  belongs_to :table
  attr_accessible :note
end
