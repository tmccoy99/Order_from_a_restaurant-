require "menu"
require "menu_item"
require "order"


describe "Integration testing" do
  
  large_chips = MenuItem.new("Large Chips", 3, :Sides)
  mushy_peas = MenuItem.new("Mushy Peas", 2.5, :Sides)
  cod = MenuItem.new("Cod", 7.7, :Fish)
  haddock = MenuItem.new("Haddock", 8.36, :Fish)
  jb_sausage = MenuItem.new("Jumbo Battered Sausage", 2.2, :Traditional)
  pea_fritter = MenuItem.new("Pea Fritter", 2.95, :Traditional)
  
  before(:each) do
    @io = double :io
    @menu = Menu.new("Finn's Fantastic Fish Bar", @io)
    @menu.add_items(cod, haddock, jb_sausage, pea_fritter,
    large_chips, mushy_peas)
    @order = Order.new(@menu, @io)
  end
  
  context "Menu#print called:" do
   it "prints formatted menu with restaurant_name in heading" do
    
      expect(@io).to receive(:puts).with("Welcome to Finn's Fantastic Fish Bar!"\
      "\nHere's the menu:").ordered
      expect(@io).to receive(:puts).with("\n#FISH\n\n").ordered
      expect(@io).to receive(:puts).with("Cod: £7.70").ordered
      expect(@io).to receive(:puts).with("Haddock: £8.36").ordered
      expect(@io).to receive(:puts).with("\n#TRADITIONAL\n\n").ordered
      expect(@io).to receive(:puts).with("Jumbo Battered Sausage: £2.20").ordered
      expect(@io).to receive(:puts).with("Pea Fritter: £2.95")
      expect(@io).to receive(:puts).with("\n#SIDES\n\n").ordered
      expect(@io).to receive(:puts).with("Large Chips: £3.00").ordered
      expect(@io).to receive(:puts).with("Mushy Peas: £2.50").ordered
      
      @menu.print
    end

  end

  context "Order#create called but no items selected" do
    it "prints menu, then prints message saying no order placed" do
      expect(@menu).to receive(:print).ordered
      expect(@io).to receive(:puts).with("Which item would you like to add to your order?\n"\
      "To finish ordering, just hit return").ordered
      expect(@io).to receive(:gets).and_return("").ordered
      expect(@io).to receive(:puts).with("\nSorry, no items have been added to this order!")

      @order.create
    end
  end

  context "Order#create called with proper inputs" do
    it "prints menu, allows items to be selected, then prints itemised receipt" do
      expect(@menu).to receive(:print).ordered
      expect(@io).to receive(:puts).with("Which item would you like to add to your order?\n"\
      "To finish ordering, just hit return").ordered
      expect(@io).to receive(:gets).and_return("Haddock").ordered
      expect(@io).to receive(:puts).with("How many portions of Haddock would you like?").ordered
      expect(@io).to receive(:gets).and_return("5").ordered
      expect(@io).to receive(:puts).with("5 portions of Haddock added to order!").ordered
      

      expect(@io).to receive(:puts).with("Which item would you like to add to your order?\n"\
      "To finish ordering, just hit return").ordered
      expect(@io).to receive(:gets).and_return("Mushy Peas").ordered
      expect(@io).to receive(:puts).with("How many portions of Mushy Peas would you like?").ordered
      expect(@io).to receive(:gets).and_return("3").ordered
      expect(@io).to receive(:puts).with("3 portions of Mushy Peas added to order!").ordered

      expect(@io).to receive(:puts).with("Which item would you like to add to your order?\n"\
      "To finish ordering, just hit return").ordered
      expect(@io).to receive(:gets).and_return("Jumbo Battered Sausage").ordered
      expect(@io).to receive(:puts).with("How many portions of Jumbo Battered Sausage would you like?").ordered
      expect(@io).to receive(:gets).and_return("4").ordered
      expect(@io).to receive(:puts).with("4 portions of Jumbo Battered Sausage added to order!").ordered

      expect(@io).to receive(:puts).with("Which item would you like to add to your order?\n"\
      "To finish ordering, just hit return").ordered
      expect(@io).to receive(:gets).and_return("").ordered
      
      expect(@io).to receive(:puts).with("\nHere is your receipt!\n\n").ordered
      expect(@io).to receive(:puts).with("Haddockx5: £41.80").ordered
      expect(@io).to receive(:puts).with("Mushy Peasx3: £7.50").ordered
      expect(@io).to receive(:puts).with("Jumbo Battered Sausagex4: £8.80").ordered
      expect(@io).to receive(:puts).with("Total: £58.10").ordered
      @order.create
    end
  end
end

# order = Order(menu)
# order.select -> menu is printed
# -> "Which item would you like to add to your order?"
# -> "To select an item, type in its name. Or if your order is complete, just hit return"
