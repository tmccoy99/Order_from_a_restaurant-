require "order"

describe Order do

  before(:each) do
    cod = double(name: "Cod", price: 7.7)
    chips = double(name: "Chips", price: 3.35)
    pea_fritter = double(name: "Pea Fritter", price: 2.95)
    @menu = double(:menu, categorised_items: {key1: [cod, chips],
    key2: [pea_fritter]})
    @io = double :io
    @order = Order.new(@menu, @io)
  end

  it "constructs" do
  end

  context "create is called" do

    it "calls #print on @menu, allows items to be selected and then calls #receipt on self" do

      expect(@menu).to receive(:print).ordered
      expect(@io).to receive(:puts).with("Which item would you like to add to your order?\n"\
      "To finish ordering, just hit return").ordered
      expect(@io).to receive(:gets).and_return("Chips").ordered
      expect(@io).to receive(:puts).with("How many portions of Chips would you like?").ordered
      expect(@io).to receive(:gets).and_return("3").ordered
      expect(@io).to receive(:puts).with("3 portions of Chips added to order!").ordered
      

      expect(@io).to receive(:puts).with("Which item would you like to add to your order?\n"\
      "To finish ordering, just hit return").ordered
      expect(@io).to receive(:gets).and_return("Pea Fritter").ordered
      expect(@io).to receive(:puts).with("How many portions of Pea Fritter would you like?").ordered
      expect(@io).to receive(:gets).and_return("2").ordered
      expect(@io).to receive(:puts).with("2 portions of Pea Fritter added to order!").ordered

      expect(@io).to receive(:puts).with("Which item would you like to add to your order?\n"\
      "To finish ordering, just hit return").ordered
      expect(@io).to receive(:gets).and_return("").ordered
      
      expect(@io).to receive(:puts).with("\nHere is your receipt!\n\n").ordered
      expect(@io).to receive(:puts).with("Chipsx3: £10.05").ordered
      expect(@io).to receive(:puts).with("Pea Fritterx2: £5.90").ordered
      expect(@io).to receive(:puts).with("Total: £15.95").ordered
      @order.create
    end

  end

end
  