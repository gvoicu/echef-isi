class Order < ActiveRecord::Base
  belongs_to :table
	belongs_to :user, :class_name => 'Waiter', :foreign_key => 'waiter_id'
	belongs_to :user, :class_name => 'Chef', :foreign_key => 'chef_id'

  attr_accessible :closed_at, :rating
end
