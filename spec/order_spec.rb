require "order"

describe Order do

  before(:each) do
    # item1 = "Chips: £2.50"
    # item2 = "Cod: £7.70"
    # item3 = "Pea Fritter: £2.95"
    @menu = double :menu
    @io = double :io
    @order = Order.new(@menu, @io)
  end

  it "constructs" do
  end

  context "create is called" do

    it "calls #print on @menu, allows items to be selected and then prints receipt" do
      expect(@menu).to receive(:print).ordered
      expect(@io).to receive(:puts).with("Which item would you like to add to your order?").ordered
      expect(@io).to receive(:puts).with("To finish ordering, just hit return").ordered
      expect(@io).to receive(:gets).and_return("Chips").ordered
      expect(@io).to receive(:puts).with("And how many portions of Chips would you like?").ordered
      expect(@io).to receive(:gets).and_return("3").ordered
      expect(@io).to receive(:puts).with("3 portions of Chips added to order!").ordered
     
      @order.create
    end

  end

end
  