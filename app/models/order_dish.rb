class OrderDish < ActiveRecord::Base
  belongs_to :order
  belongs_to :dish
  attr_accessible :dish_status, :note, :time
  default_scope :order => "dish_status ASC"
end
