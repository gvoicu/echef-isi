class Booking < ActiveRecord::Base
  belongs_to :table
  attr_accessible :confirmed, :email, :end, :name, :phone, :start, :table
  validates :phone, :presence => true, :numericality => { :only_integer => true, :message => 'should contain only numbers!'}, :length => {:is => 10}
  validates :name, :presence => true, :format => {:with => /[a-zA-Z]/, :message => 'should contain only letters!'}
  validates :email, :presence => true, :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => 'is not an email!'}
end
