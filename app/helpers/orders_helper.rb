module OrdersHelper
  def display_dish_action(order, dish)
    order_dish = OrderDish.where(:order_id => order.id, :dish_id => dish.id).first

    if order_dish.is_pending?
      link_to "Mark as preparing", "/mark_dishes_as_preparing?order_dish_id=#{order_dish.id}"
    elsif order_dish.is_preparing?
      link_to "Mark as ready", "/mark_dishes_as_ready?order_dish_id=#{order_dish.id}"
    elsif order_dish.is_ready?
      if current_user.waiter?
        link_to "Mark as delivered", "/mark_dishes_as_delivered?order_dish_id=#{order_dish.id}"
      else
        "<b>Is ready</b>"
      end
    else
      "<b>Delivered</b>"
    end
  end

end
