require_relative '../lib/item.rb'
require_relative '../lib/sales_tax_policy.rb'

RSpec.describe SalesTaxPolicy do

  let(:sales_tax_policy) { SalesTaxPolicy.new(item) }

  describe '#applicable_rate' do
    context 'when item is under exempt category' do
      context 'when item is not imported' do
        let(:item) do 
          Item.new(name: 'test_item1',
                   price: 10.34,
                   category: 'book',
                   imported: false) 
        end

        it 'returns nil' do
          expect(sales_tax_policy.applicable_rate).to eq nil
        end
      end
    end

    context 'when item is under exempt category' do
      context 'when item is imported' do
        let(:item) do 
          Item.new(name: 'test_item1',
                   price: 10.34,
                   category: 'book',
                   imported: true) 
        end

        it 'returns nil' do
          expect(sales_tax_policy.applicable_rate).to eq sales_tax_policy.import_duty
        end
      end
    end

    context 'when item is not under exempt category' do
      context 'when item is not imported' do
        let(:item) do 
          Item.new(name: 'test_item1',
                   price: 10.34,
                   category: 'others',
                   imported: false) 
        end

        it 'returns basic sales tax rate as float' do
          expect(sales_tax_policy.applicable_rate).to eq sales_tax_policy.basic_sales_tax
        end
      end
    end

    context 'when item is not under exempt category' do
      context 'when item is imported' do
        let(:item) do 
          Item.new(name: 'test_item1',
                   price: 10.31,
                   category: 'others',
                   imported: true) 
        end

        it 'returns import duty rate' do
          expect(sales_tax_policy.applicable_rate).to eq (sales_tax_policy.import_duty + sales_tax_policy.basic_sales_tax)
        end
      end
    end
  end
end
