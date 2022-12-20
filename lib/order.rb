class Order

  def initialize(menu, io = Kernel)
    @menu = menu
    @io = io
    @items_to_prices = {}
    @menu.categorised_items.values.flatten.each do |item|
      @items_to_prices[item.name] = item.price
    end
  end

  def create
    @ordered_items = Hash.new(0)
    @menu.print
    while true
      item_name = get_item
      break if item_name.empty?
      item_quantity = get_quantity(item_name)
      @ordered_items[item_name] += item_quantity
      @io.puts("#{item_quantity} portions of #{item_name} added to order!")
    end
    receipt
  end

  def receipt
    if @ordered_items.empty?
      @io.puts "Sorry, no items have been added to this order!"
      return
    end
    @io.puts("\nHere is your receipt!\n\n")
    total = 0
    @ordered_items.each do |name, quantity|
      price = @items_to_prices[name] * quantity
      total += price
      @io.puts "#{name}x#{quantity}: #{to_price(price)}"
    end
    @io.puts "Total: #{to_price(total)}"
  end

  private

  def get_item
    while true
      @io.puts("Which item would you like to add to your order?\n"\
      "To finish ordering, just hit return")
      item_name = @io.gets.chomp.split.map(&:capitalize).join(" ")
      return item_name if @items_to_prices.has_key?(item_name) || item_name.empty?
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

  def to_price(num)
    num = "£" + num.to_f.round(2).to_s
    num += "0" if num[-2] == "."
    num
  end
end