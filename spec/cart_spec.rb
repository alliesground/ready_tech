require_relative '../lib/cart.rb'
require_relative '../lib/item.rb'
require_relative '../lib/sales_tax_policy.rb'

RSpec.describe Cart do
  let(:cart) { Cart.new }
  let(:item1) do 
    Item.new(name: 'book',
             price: 12.00,
             category: 'book',
             imported: true)
  end
  let(:item2) do 
    Item.new(name: 'book',
             price: 12.00,
             category: 'others',
             imported: false)
  end

  before :each do 
    cart.add(item: item1) 
    cart.add(item: item2) 
  end

  describe '#total' do
    it 'returns sum of prices of all items in the cart' do
      expect(cart.total).to eq 24
    end
  end

  describe '#total_sales_tax' do
    it 'returns total of sales taxes for all items in the cart' do
      expect(cart.total_sales_tax).to eq 1.8
    end
  end
end
