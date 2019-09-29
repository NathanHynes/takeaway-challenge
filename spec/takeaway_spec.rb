require "takeaway"
require "menu"
require "order"

describe Takeaway do
  let(:takeaway) { Takeaway.new(menu: menu) }
  let(:menu) { double :menu, menu: dishes, print_menu: printed_menu, add_item: '', item_on_menu?: ''}
  let(:dishes) { { pizza: 3, drink: 4, pie: 5 } }
  let(:printed_menu) { "Menu: 1. Pizza, £3" }
  let(:printed_order) { "Current order:\n3 Pizza\n"}

  it "initialises with a menu" do
    expect(takeaway.menu).to eq menu
  end

  it "initialises with an empty order" do
    expect(takeaway.order.current_order).to be_empty
  end

  describe '#view_menu' do
    it "shows the menu" do
      expect(takeaway.view_menu).to eq printed_menu
    end
  end

  describe '#add_to_menu' do
    it "lets you know that item was added to the menu" do
      item = 'Korma'
      price = 5
      expect(takeaway.add_to_menu(item, price)).to eq "#{item} was added to menu"
    end
  end

  describe '#add_to_order' do

    it "lets you know that item was added to order with specified quantity" do
      item = 'pizza'
      quantity = 3
      expect(takeaway.add_to_order(item, quantity)).to eq "#{quantity} #{item} added to order"
    end
  end
  describe '#view_order' do
    before do
      item = 'pizza'
      quantity = 3
      takeaway.add_to_order(item, quantity)
    end

    it "shows the order" do
      expect { takeaway.view_order }.to output(printed_order).to_stdout
    end
  end
end
