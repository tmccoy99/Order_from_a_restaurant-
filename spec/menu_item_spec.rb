require "menu_item"

describe MenuItem do
  it "constructs" do
    MenuItem.new("chips", 10, :Sides)
  end

  it "instance variables can be read" do
    chips = MenuItem.new("Chips", 2.5, :Sides)
    expect(chips.name).to eq "Chips"
    expect(chips.price).to eq 2.5
    expect(chips.category).to eq :Sides
  end
  
  it "can return its price as a formatted string" do
    expect(MenuItem.new("", 2.39, :S).price_string).to eq "£2.39"
    expect(MenuItem.new("", 10.1, :S).price_string).to eq "£10.10"
    expect(MenuItem.new("", 3, :S).price_string).to eq "£3.00"
  end
end