class Table < ActiveRecord::Base
  has_many :orders
  has_many :notifications

  attr_accessible :number, :persons, :qr_code

  def get_active_orders
    self.orders.find_all{ |o| !o.is_payed? }
  end

  def has_notification?
    Notification.where(:table_id => self.id, :status => [false, nil]).present?
  end
end
