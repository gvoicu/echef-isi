class Order < ActiveRecord::Base
  belongs_to :table
	belongs_to :user, :class_name => 'Waiter', :foreign_key => 'waiter_id'
	belongs_to :user, :class_name => 'Chef', :foreign_key => 'chef_id'

  has_many :order_dishes
  has_many :dishes, :through => :order_dishes

  attr_accessible :closed_at, :rating, :table_id

  def calculate_total_sum
    self.dishes.sum(:price)
  end

  def mark_dishes_as_payed
    OrderDish.where(:order_id => self.id).update_all(:dish_status => Constant::DS_PAYED)
    self.update_attributes(:closed_at => Time.now)
  end

  def is_payed?
    if self.order_dishes.present?
      self.order_dishes.last.dish_status == Constant::DS_PAYED
    else
      false
    end
  end
end
