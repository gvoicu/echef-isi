module OrdersHelper
  def display_dish_action(order_dish)
    if order_dish.is_pending?
      link_to "Preparing", "/mark_dishes_as_preparing?order_dish_id=#{order_dish.id}"
    elsif order_dish.is_preparing?
      link_to "Ready", "/mark_dishes_as_ready?order_dish_id=#{order_dish.id}"
    elsif order_dish.is_ready?
      if current_user.waiter?
        link_to "Delivered", "/mark_dishes_as_delivered?order_dish_id=#{order_dish.id}"
      else
        "<b>Is ready</b>"
      end
    else
      "<b>Delivered</b>"
    end
  end

end
