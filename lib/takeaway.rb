require_relative 'menu'
require_relative 'order'
require_relative 'messenger'

class Takeaway
  attr_reader :menu, :order

  def initialize(menu:, order: Order.new(menu), messenger: Messenger.new)
    @menu = menu
    @order = order
    @messenger = messenger
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
    "#{quantity}x #{item} added to order"
  end

  def view_order
    order.print_order
  end

  def checkout(price)
    order.confirm_total(price)
    expected_time = Time.now + (60 * 60)
    body = "Thank you, your order was placed and will be delivered before #{expected_time.strftime("%k:%M")}"
    to = ENV['TWILIO_FROM']
    @messenger.send_message(to, body)
    "Thank you your order has been placed, expect a text to confirm delivery time"
  end
end
