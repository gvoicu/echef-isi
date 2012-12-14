class Dish < ActiveRecord::Base
  belongs_to :dish_type
  attr_accessible :grams, :ingredients, :price, :time
end
