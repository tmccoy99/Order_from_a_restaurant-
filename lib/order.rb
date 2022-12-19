class Order

  def initialize(menu, io = Kernel)
    @menu = menu
    @io = io
  end

  def create
    @menu.print
    @io.puts("Which item would you like to add to your order?")
    @io.puts("To finish ordering, just hit return")
    item_name = @io.gets.chomp
    @io.puts("And how many portions of #{item_name} would you like?")
    item_quantity = @io.gets.chomp.to_i
    @io.puts("#{item_quantity} portions of #{item_name} added to order!")

  end

end