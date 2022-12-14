class Menu
  
  def initialize(restaurant_name, io = Kernel)
    @restaurant_name = restaurant_name
    @io = io
    @categorised_items = Hash.new { |hash, key| hash[key] = [] }
  end
  
  def add_items(*items)
    categorise(items)
  end
  
  def print
    if @categorised_items.empty?
      @io.puts "Sorry, no items on the menu!"
      return
    end
    print_header
    print_items
  end
  
  private
  
  def print_header
    @io.puts("Welcome to #{@restaurant_name}!\nHere's the menu:")
  end
  
  def categorise(items)
    items.each { |item| @categorised_items[item.category] << item }
  end
  
  def print_items
    @categorised_items.each do |category, items|
      @io.puts "\n##{category.upcase}:\n\n"
    end
  end
end