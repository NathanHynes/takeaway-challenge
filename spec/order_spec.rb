require 'order'

describe Order do
  let(:order) { Order.new(menu) }
  let(:menu) { double :menu, menu: dishes, add_item: '', item_on_menu?: '' }
  let(:dishes) { { pizza: 3, drink: 4, pie: 5 } }
  let(:printed_order) { "Current order:\n3 Korma\n4 Pizza\n" }
  let(:dish) { :pizza }

  it "initialises with an empty order" do
    expect(order.current_order).to be_empty
  end

  it "initialises with a menu" do
    expect(order.menu).to eq menu
  end

  describe "#add_to_basket" do
    let(:item) { :Korma }
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

  describe '#print_order' do
    before do
      order.add_to_basket(:korma, 3)
      order.add_to_basket(:pizza, 4)
    end
    it "prints order to standard output" do
      expect { order.print_order }.to output(printed_order).to_stdout
    end
  end

  describe '#order_total' do
    it "returns the order total" do
      order.add_to_basket('pizza', 4)
      expect(order.order_total).to eq 12
    end
  end
end