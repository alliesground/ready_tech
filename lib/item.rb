class Item
  attr_reader :name, :price, :category, :imported

  def initialize(name:, price:, category:, imported: false)
    @name = name
    @price = price
    @category = category
    @imported = imported
  end

  def imported?
    imported
  end
end
