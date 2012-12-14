class Booking < ActiveRecord::Base
  belongs_to :table
  attr_accessible :confirmed, :email, :end, :name, :phone, :start
end
