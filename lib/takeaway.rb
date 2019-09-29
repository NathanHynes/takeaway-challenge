require_relative 'menu'

class Takeaway
  attr_reader :menu, :order

  def initialize(menu = Menu.new({ MARGHERITA: 3 }))
    @menu = menu
    @order = []
  end

  def view_menu
    menu.print_menu
  end

  def add_to_menu(item, price)
    menu.add_item(item, price)
    "#{item} was added to menu"
  end
end
