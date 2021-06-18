class Cart
  attr_reader :items

  def initialize()
    @items = []
  end

  def add(**item)
    items << item
  end

  def total
    total = 0

    items.each do |cart_item|
      total += cart_item[:item].price
    end

    total
  end

  def total_sales_tax
    total = 0

    items.each do |item|
      next unless sales_tax_policy(item[:item]).applicable_rate 
      total += sales_tax(item)
    end

    total.round(2)
  end

  private

  def sales_tax(item)
    (sales_tax_policy(item[:item]).applicable_rate * item[:item].price).round(2)
  end

  def sales_tax_policy(item)
    SalesTaxPolicy.new(item)
  end
end
