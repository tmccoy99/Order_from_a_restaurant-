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

    large_chips = double(name: "Large Chips", price: 3,
    category: :Sides, price_string: "£3.00")

    mushy_peas = double(name: "Mushy Peas", price: 2.5,
    category: :Sides, price_string: "£2.50")

    cod = double(name: "Cod", price: 7.7,
    category: :Fish, price_string: "£7.70")

    haddock = double(name: "Haddock", price: 8.36, 
    category: :Fish, price_string: "£8.36")

    jb_sausage = double(name: "Jumbo Battered Sausage", price: 2.2,
    category: :Traditional, price_string: "£2.20")

    pea_fritter = double(name: "Pea Fritter", price: 2.95,
    category: :Traditional, price_string: "£2.95")

    @io = double :io
    @menu = Menu.new("Finn's Fantastic Fish Bar", @io)
    @menu.add_items(cod, haddock, jb_sausage, pea_fritter,
    large_chips, mushy_peas)

  end

  it "#print returns formatted menu with @restaurant_name in header" do

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

  it "print(header = false) returns formatted menu without header" do
    expect(@io).to receive(:puts).with("\n#FISH\n\n").ordered
    expect(@io).to receive(:puts).with("Cod: £7.70").ordered
    expect(@io).to receive(:puts).with("Haddock: £8.36").ordered
    expect(@io).to receive(:puts).with("\n#TRADITIONAL\n\n").ordered
    expect(@io).to receive(:puts).with("Jumbo Battered Sausage: £2.20").ordered
    expect(@io).to receive(:puts).with("Pea Fritter: £2.95")
    expect(@io).to receive(:puts).with("\n#SIDES\n\n").ordered
    expect(@io).to receive(:puts).with("Large Chips: £3.00").ordered
    expect(@io).to receive(:puts).with("Mushy Peas: £2.50").ordered

    @menu.print(header = false)
  end

end