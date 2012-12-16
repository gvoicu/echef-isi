namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [OrderDish, Order, Table, Notification, Booking, Complaint, Dish, DishType].each(&:delete_all)
    
    DishType.populate 5 do |dt|
      dt.name = Faker::Name.title
      Dish.populate 1..15 do |d|
        d.dish_type_id = dt.id
        d.name = Faker::Name.title
        d.ingredients = Faker::Lorem.sentence(10)
        d.grams = 50 .. 500
        d.price = 5 .. 50
        d.time = 5 .. 30
      end
    end
    
  end
end