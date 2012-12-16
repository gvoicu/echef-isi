class OrderController < ApplicationController
  
  def index
     order = session[:order]
     
     @order_dishes = OrderDish.where("order_id = ?", order.id)

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  # Remove dish from order
  def remove
    order_dish = OrderDish.find(params[:dish_id])
    if order_dish
      order_dish.delete
    end
    
    respond_to do |format|
      format.html { redirect_to '/order'}
    end
  end
  
  # Send order
  def send_order
    order = session[:order]
    
    order_dish = OrderDish.where("order_id = ? AND dish_status = ?", order.id, 1)
    
    order_dish.each do |od|
      od.dish_status = 2
      od.save
    end
    
    respond_to do |format|
      format.html { redirect_to '/order'}
    end
  end
  
end