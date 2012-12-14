class Complaint < ActiveRecord::Base
  attr_accessible :body, :email, :name, :phone
end
