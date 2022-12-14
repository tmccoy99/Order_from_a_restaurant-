require "menu"

describe "Menu unit tests before items added:" do
 
  it "constructs" do
    Menu.new("Restaurant Name")
  end
  
  it "#print prints no item message" do
    io = double :io
    menu =  Menu.new("Name", io)
    expect(io).to receive(:puts).with("Sorry, no items on the menu!")
    menu.print
  end
      
end

describe "Menu unit tests after items added:" do
  
  def make_item_dbl(name, price, category)
    double(name: name, price: price)
  end
    
  before(:each) do
    large_chips = double(name: "Large Chips", price: 3, category: :Sides)
    cod = double(name: "Cod", price: 7.7, category: :Fish)
    haddock = double(name: "Haddock", price: 8.36, category: :Fish)
    jb_sausage = double(name: "Jumbo Battered Sausage", price: 2.2,
    category: :Traditional)
    @io = double :io
    
    @menu = Menu.new("Finn's Fantastic Fish Bar", @io)
    @menu.add_items(cod, large_chips, jb_sausage)
  end

  it "#print returns formatted menu with @restaurant_name in header" do
    expect(@io).to receive(:puts).with("Welcome to Finn's Fantastic Fish Bar!"\
    "\nHere's the menu:").ordered
    expect(@io).to receive(:puts).with("\n#FISH:\n\n").ordered
    expect(@io).to receive(:puts).with("\n#SIDES:\n\n").ordered
    expect(@io).to receive(:puts).with("\n#TRADITIONAL:\n\n").ordered
    # expect(@io).to receive(:puts).with("Cod: 7.00").ordered
    # expect(@io).to receive(:puts).with("Large Chips: £3.00").ordered
    @menu.print
  end
end