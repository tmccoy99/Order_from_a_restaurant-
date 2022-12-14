class MenuItem
  attr_reader :name, :price, :category
  
  def initialize(name, price, category)
    @name = name
    @price = price.to_f.round(2)
    @category = category
  end
  
  def price_string
    str = "£#{@price}"
    str += "0" if str[-2] == "."
    str
  end
  
end