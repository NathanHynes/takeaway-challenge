require 'order'

describe Order do
  let(:order) { Order.new(menu) }
  let(:menu) { double :menu, menu: dishes,  print_menu: printed_menu, add_item: '', item_on_menu?: '' }
  let(:dishes) { { pizza: 3, drink: 4, pie: 5 } }
  let(:printed_menu) { "Menu: 1. Pizza, £3" }

  it "initialises with an empty order" do
    expect(order.current_order).to be_empty
  end

  it "initialises with a menu" do
    expect(order.menu).to eq menu
  end

  describe "#add_to_basket" do
    let(:item) { 'Korma' }
    let(:quantity) { 3 }
    it { is_expected.to respond_to(:add_to_basket).with(2).arguments }

    it "raises error if item is not on menu" do
      allow(menu).to receive(:item_on_menu?) { raise "#{item} is not on Menu" }
      expect { order.add_to_basket(item, quantity) }.to raise_error "#{item} is not on Menu"
    end

    it "adds item to order" do
      order.add_to_basket(item, quantity)
      expect(order.current_order.flat_map(&:keys)).to include(item.to_sym)
    end
  end
end
