require "takeaway"
require "menu"

describe Takeaway do
  let(:takeaway) { Takeaway.new(menu) }
  let(:menu) { double :menu, print_menu: printed_menu, add_item: '' }
  let(:printed_menu) { "Menu: 1. Pizza, £3" }

  it "initialises with a menu" do
    expect(takeaway.menu).to eq menu

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
      expect(takeaway.add_to_menu(item,price)).to eq "#{item} was added to menu"
    end
  end
end
