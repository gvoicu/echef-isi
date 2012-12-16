class MenuController < ApplicationController
  
  def index
     @dishes = Dish.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dishes }
    end
  end
  
  # Get table from QR.
  def table
    qr_table = Table.find_by_qr_code(params[:qr])
    
    order = Order.new
    order.table = qr_table
    
    order.save
    
    session[:order] = order
    
    respond_to do |format|
      format.html { redirect_to '/menu'}
    end
  end
  
  # Add dish to order.
  def add
    dish = Dish.find(params[:dish_id])
    
    order_dish = OrderDish.new
    order_dish.order = session[:order]
    order_dish.dish = dish
    
    # 2 for sent order
    order_dish.dish_status = 1;
    
    order_dish.time = dish.time;
    
    order_dish.save
    
    respond_to do |format|
      format.html { redirect_to '/menu'}
    end
  end
  
end