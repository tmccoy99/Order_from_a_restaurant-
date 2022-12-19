require "order"

describe Order do

  before(:all) do
    # item1 = "Chips: £2.50"
    # item2 = "Cod: £7.70"
    # item3 = "Pea Fritter: £2.95"
    @menu_dbl = double :menu
    @order = Order.new(@menu_dbl)
  end

  it "constructs" do
  end

  context "create is called" do

    it "calls print on saved menu" do
      expect(@menu_dbl).to receive(:print)
      @order.create
    end

    

  end

end
  