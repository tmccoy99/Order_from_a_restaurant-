class Order

  def initialize(menu, io = Kernel)
    @menu = menu
    @io = io
    @items_to_prices = {}
    @menu.categorised_items.values.flatten.each do |item|
      @items_to_prices[item.name] = item.price
    end
    @ordered_items = Hash.new(0)
  end

  def create
    @menu.print
    item_name = get_item
    item_quantity = get_quantity(item_name)
    @io.puts("#{item_quantity} portions of #{item_name} added to order!")

  end

  private

  def get_item
    while true
      @io.puts("Which item would you like to add to your order?")
      @io.puts("To finish ordering, just hit return")
      item_name = @io.gets.chomp.split.map(&:capitalize).join(" ")
      return item_name if @items_to_prices.has_key?(item_name)
      @io.puts "Sorry, that item is not on the menu\n\n"
    end
  end

  def get_quantity(item_name)
    while true
      @io.puts("How many portions of #{item_name} would you like?")
      quantity = @io.gets.chomp.to_i
      return quantity unless quantity == 0
      @io.puts "Sorry, you have not entered a valid quantity."\
      "Please enter a positive integer\n\n"
    end
  end
end