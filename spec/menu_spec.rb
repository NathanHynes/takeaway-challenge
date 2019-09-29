require 'menu'

describe Menu do
  let(:menu) { Menu.new(dishes) }
  let(:dishes) { { pizza: 3, drink: 4, pie: 5 } }
  let(:dish) { 'Korma' }
  let(:price) { 5 }

  it "initialises with dishes" do
    expect(menu.menu).to eq dishes
  end

  describe '#print_menu' do
    it "displays menu to customer" do
      expect(menu.print_menu).to eq "Menu: 1. Pizza, £3, 2. Drink, £4, 3. Pie, £5"
    end
  end

  describe '#item_on_menu?' do
    it { is_expected.to respond_to(:item_on_menu?).with(1).argument }

    it "returns true if item is on menu" do
      item = 'pizza'
      expect(menu.item_on_menu?(item)).to eq true
    end

    it "raises error if item is not on menu" do
      item = 'pasty'
      expect { menu.item_on_menu?(item) }.to raise_error "#{item} is not on Menu"
    end
  end

  describe '#add_item' do
    it { is_expected.to respond_to(:add_item).with(2).argument }

    it "adds item to the menu" do
      menu.add_item(dish, price)
      expect(menu.item_on_menu?(dish)).to eq true
    end

    it "returns true if item is added to menu" do
      expect(menu.add_item(dish,price)).to eq true
    end
  end
end
