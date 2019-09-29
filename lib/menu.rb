class Menu
  attr_reader :menu
  def initialize(menu = { MARGHERITA: 3 })
    @menu = menu
    @sample_menu = {
      MARGHERITA: 3,
      FUNGHI: 4,
      FIORENTINA: 5,
      FORMAGGI: 5,
      PEPPERONI: 6
      }
  end

  def print_menu
    printed_menu = "Menu: "
    menu.each_with_index do |(k, v), i|
      printed_menu += "#{i + 1}. #{k.to_s.capitalize}, £#{v}, "
    end
    printed_menu.slice(0..-3)
  end

  def item_on_menu?(item)
    raise "#{item} is not on Menu" unless menu_include?(item)
    true
  end

  def add_item(dish, price)
    menu.store(dish.to_sym, price)
    true
  end

  private

  def menu_include?(item)
    menu.key?(item.to_sym)
  end
end
