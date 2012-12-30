class Table < ActiveRecord::Base
  has_many :orders

  attr_accessible :number, :persons, :qr_code

  def get_active_orders
    self.orders.where(:order_status => Constant::ORDER_OPEN, :table_id => self.id)
  end
end
