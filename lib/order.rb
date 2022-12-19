class Order

  def initialize(menu)
    @menu = menu
  end

  def create
    @menu.print
  end

end