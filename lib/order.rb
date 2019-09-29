require_relative 'menu'

class Order
  attr_reader :current_order, :menu

  def initialize(menu = Menu.new({ MARGHERITA: 3 }))
    @current_order = []
    @menu = menu
  end

  def add_to_basket(item, quantity)
    menu.item_on_menu?(item)
    current_order << { item.capitalize.to_sym => quantity } 
  end

end
