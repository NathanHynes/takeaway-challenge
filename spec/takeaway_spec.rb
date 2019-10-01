require "takeaway"

describe Takeaway do
  let(:takeaway) { Takeaway.new(menu: menu, order: order, messenger: messenger)}
  let(:menu) { double :menu, menu: dishes, print_menu: printed_menu, add_item: '', item_on_menu?: '' }
  let(:order) { double :order, current_order: '', add_to_basket: '', confirm_total: true, clear_order: [] }
  let(:dishes) { { pizza: 3, drink: 4, pie: 5 } }
  let(:printed_menu) { "Menu: 1. Pizza, £3" }
  let(:printed_order) { "Current order:\n3xPizza\n" }
  let(:messenger) { double :messenger, send_message: "hello" }


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
      expect(takeaway.add_to_order(item, quantity)).to eq "#{quantity}x #{item} added to order"
    end
  end

  describe "#checkout" do
    before do
      item = 'pizza'
      quantity = 3
      takeaway.add_to_order(item, quantity)
    end

    it "raises error if passed incorrect price" do
      allow(order).to receive(:confirm_total) { raise "Cannot complete order: Incorrect total" }
      expect { takeaway.checkout(10) }.to raise_error "Cannot complete order: Incorrect total"
    end

    it "completes order if passed correct price" do
      expect(takeaway.checkout(9)).to eq "Thank you your order has been placed, expect a text to confirm delivery time"
    end

    it "sends a text" do
      twilio_to = ENV['TWILIO_TO']
      expected_time = Time.now + (60 * 60)
      body = "Thank you, your order was placed and will be delivered before #{expected_time.strftime("%k:%M")}"
      expect(messenger).to receive(:send_message).with(twilio_to, body)
    end
  end
end
