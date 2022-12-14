require "menu"
require "menu_item"


describe "Integration testing" do
  
  large_chips = MenuItem.new("Large Chips", 3, :Sides)
  small_chips = MenuItem.new("Small Chips", 2, :Sides)
  mushy_peas = MenuItem.new("Mushy Peas", 2.5, :Sides)
  cod = MenuItem.new("Cod", 7.7, :Fish)
  haddock = MenuItem.new("Haddock", 8.36, :Fish)
  jb_sausage = MenuItem.new("Jumbo Battered Sausage", 2.2, :Traditional)
  pea_fritter = MenuItem.new("Pea Fritter", 2.95, :Traditional)
  
  before(:each) do
    @io = double :io
    @menu = Menu.new("Finn's Fantastic Fish Bar", @io)
    @menu.add_items(large_chips, small_chips, mushy_peas, cod, haddock,
    jb_sausage, pea_fritter)
  end
  
  context "#print called after items added to menu instance" do
   xit "prints formatted menu with restaurant_name in heading" do
    expect(@io).to receive(:puts).with("Welcome to Finn's Fantastic Fish Bar!"\
    "\nHere's the menu:").ordered
    @menu.print
    end
  end
  
end

#large_chips = MenuItem.new("Large Chips", 3, :Sides)
#small_chips = MenuItem.new("Small Chips", 2, :Sides)
#mushy_peas = MenuItem.new("Mushy Peas", 2.5, :Sides)
#cod = MenuItem.new("Cod", 7, :Fish)
#haddock = MenuItem.new("Haddock", 8, :Fish)
#jb_sausage = MenuItem.new("Jumbo Battered Sausage", 2.2, :Traditional)
#pea_fritter = MenuItem.new("Pea Fritter", 2.95, :Traditional)
#fnc_menu = Menu.new("Finn's Fantastic Fish Bar")
#Menu.print
# Hello! Welcome to Finn's Fantastic Fish Bar.
# Here's the menu for you to browse at your pleasure.