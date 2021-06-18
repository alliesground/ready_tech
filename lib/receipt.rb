class Receipt
  def self.print(cart)
    cart.items.each do |cart_item|
      puts "#{cart_item[:quantity]}, #{cart_item[:item].name}, %0.2f" % [cart_item[:item].price]
    end

    puts "Sales Taxes: %0.2f" % [cart.total_sales_tax]
    puts "Total: %0.2f" % [cart.total]
  end
end
