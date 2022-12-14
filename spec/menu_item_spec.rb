require "menu_item"

describe MenuItem do
  it "constructs" do
    MenuItem.new("chips", 10, :sides)
  end

end