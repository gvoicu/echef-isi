namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [OrderDish, Order, Table, Notification, Booking, Complaint, Dish, DishType].each(&:delete_all)
    
    DishType.populate 3 do |dt|
      dt.name = Faker::Name.title
      Dish.populate 1..10 do |d|
        d.dish_type_id = dt.id
        d.ingredients = Faker::Lorem.sentence(10)
        d.grams = Random.new.rand(50 .. 500)
        d.price = Random.new.rand(5 .. 50)
        d.time = Random.new.rand(5 .. 30)
      end
    end
    
  end
end