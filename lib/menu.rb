class Menu
  
  def initialize(restaurant_name, io = Kernel)
    @restaurant_name = restaurant_name
    @io = io
  end
  
  def print
    @io.puts "Sorry, no items on the menu!"
  end
end