require_relative 'menu'

class Order
  attr_reader :current_order, :menu, :total

  def initialize(menu = Menu.new({ MARGHERITA: 3 }))
    @current_order = []
    @menu = menu
    @total = 0
  end

  def add_to_basket(item, quantity)
    menu.item_on_menu?(item.to_sym)
    calculate_total(item, quantity)
    current_order << { item.capitalize.to_sym => quantity }
  end

  def print_order
    title = "Current order:"
    puts title
    current_order.each do |line|
      line.each do |k, v|
        k.to_s
        puts "#{v}x#{k.capitalize}"
      end
    end
  end

  def order_total
    @total
  end

  def confirm_total(price)
    raise 'Cannot complete order: Incorrect total' unless price == total

    true
  end

  private

  def calculate_total(item, quantity)
    @total += menu.menu[item.to_sym] * quantity
  end
end
