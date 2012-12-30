class Dish < ActiveRecord::Base
  belongs_to :dish_type
  attr_accessible :grams, :ingredients, :price, :time

  has_many :order_dishes
  has_many :orders, :through => "order_dishes"
end
