require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :menu, :order

  def initialize(menu:, order: Order.new(menu))
    @menu = menu
    @order = order
  end

  def view_menu
    menu.print_menu
  end

  def add_to_menu(item, price)
    menu.add_item(item, price)
    "#{item} was added to menu"
  end

  def add_to_order(item, quantity = 1)
    order.add_to_basket(item, quantity)
    "#{quantity}x#{item} added to order"
  end

  def view_order
    order.print_order
  end

  def checkout(price)
    order.confirm_total(price)
    "Thank you your order has been placed, expect a text to confirm delivery time"
  end
end
