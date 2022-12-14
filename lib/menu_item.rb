class MenuItem
  attr_reader :name, :price, :category
  
  def initialize(name, price, category)
    @name = name
    @price = price.round(2)
    @category = category
  end
  
end