class MenuController < ApplicationController

  def index
    @dishes     = Dish.all
    @dish_types = DishType.includes(:dishes).all

    @order = Order.find_by_id(session[:order_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dishes }
    end
  end

  # Get table from QR.
  def table
    qr_table    = Table.find_by_qr_code(params[:qr])

    order = qr_table.orders.last || Order.find_by_id(session[:order_id])
    create_order(qr_table) if order.present? && order.is_payed?

    respond_to do |format|
      format.html { redirect_to '/menu'}
    end
  end

  # Add dish to order.
  def add
    render :nothing => true 

    dish = Dish.find(params[:dish_id])

    order_dish          = OrderDish.new
    order_dish.order_id = session[:order_id]
    order_dish.dish     = dish

    # 2 for sent order
    order_dish.dish_status = 1;

    order_dish.time = dish.time;

    order_dish.save

   # respond_to do |format|
    #  format.html { redirect_to '/menu'}
   # end
  end

  private

  def create_order(qr_table)
    order       = Order.new
    order.table = qr_table
    order.save
    session[:order_id] = order.id
  end
end
