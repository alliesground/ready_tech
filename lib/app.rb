class App
  def start
    item1 = Item.new(name: 'book',
                     price: 12.49,
                     category: 'book',
                     imported: false)

    item2 = Item.new(name: 'music cd',
                     price: 14.99,
                     category: 'music',
                     imported: false)

    item3 = Item.new(name: 'chocolate bar',
                     price: 0.85,
                     category: 'others',
                     imported: true)

    cart = Cart.new

    cart.add(item: item1, quantity: 1)
    cart.add(item: item2, quantity: 1)
    cart.add(item: item3, quantity: 2)

    Receipt.print(cart)
  end
end
