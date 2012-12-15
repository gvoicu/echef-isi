class Booking < ActiveRecord::Base
  belongs_to :table
  attr_accessible :confirmed, :email, :end, :name, :phone, :start, :table
  validates :phone, :presence => true, :format => {:with => /[0-9]/, :message => 'should contain only numbers!'}, :length => {:is => 10}
  validates :name, :presence => true, :format => {:with => /[a-zA-Z]/, :message => 'should contain only letters!'}
end
