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

    order_dish = OrderDish.where("order_id = ? AND dish_status = ?", order.id, Constant::DS_PENDING)

    order_dish.each do |od|
      od.dish_status = Constant::PREPARING
      od.save
    end

    respond_to do |format|
      format.html { redirect_to '/order'}
    end
  end

  def mark_order_as_checked
    order = Order.find(params[:id])
    order.update_attributes(:order_status => Constant::ORDER_CHECKED)

    redirect_to "/orders/#{order.id}"
  end

  def mark_order_as_payed
    order = Order.find(params[:id])
    order.update_attributes(:order_status => Constant::ORDER_PAYED)

    redirect_to "/orders/#{order.id}"
  end
end
