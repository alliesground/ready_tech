class SalesTaxPolicy
  attr_reader :item, :basic_sales_tax, :import_duty

  def initialize(item)
    @item = item
    @basic_sales_tax = 0.1
    @import_duty = 0.05
  end

  def applicable_rate
    tax_rate = 0

    tax_rate += basic_sales_tax unless exempt_categories.include?(item.category)
    tax_rate += import_duty if item.imported?

    tax_rate == 0 ? nil : tax_rate
  end

  private

  def exempt_categories
    ['book', 'food', 'medical_product']
  end
end
