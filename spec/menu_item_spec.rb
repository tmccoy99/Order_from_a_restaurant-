require "menu_item"

describe MenuItem do
  it "constructs" do
    MenuItem.new("chips", 10, :sides)
  end

  it "instance variables can be read" do
    chips = MenuItem.new("Chips", 2.5, :sides)
    expect(chips.name).to eq "Chips"
    expect(chips.price).to eq 2.50
    expect(chips.category).to eq :sides
  end
end