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
  
  before(:each) do
    large_chips = double(name: "Large Chips", price: 3.00, category: :sides)
    cod = double(name: "Cod", price: 7.00, category: :fish)
    jb_sausage = double(name: "Jumbo Battered Sausage", price: 2.20,
    category: :traditional)
    @io = double :io
    
    @menu = Menu.new("Finn's Fantastic Fish Bar", @io)
    @menu.add_items(large_chips, cod, jb_sausage)
  end

  it "#print returns formatted menu with @restaurant_name in header" do
    expect(@io).to receive(:puts).with("Welcome to Finn's Fantastic Fish Bar!"\
    "\nHere's the menu:").ordered
    @menu.print
  end
end