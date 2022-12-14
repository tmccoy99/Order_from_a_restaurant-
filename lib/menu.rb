class Menu
  
  def initialize(restaurant_name, io = Kernel)
    @restaurant_name = restaurant_name
    @io = io
    @items = []
  end
  
  def add_items(*items)
    @items += items
  end
  
  def print
    if @items.empty?
      @io.puts "Sorry, no items on the menu!"
      return
    end
    print_header
  end
  
  private
  
  def print_header
    @io.puts("Welcome to #{@restaurant_name}!\nHere's the menu:")
  end
end