require "menu"

describe Menu do
  context "Initially it" do
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
end