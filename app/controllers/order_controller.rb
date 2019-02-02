class OrderController < ApplicationController
  def index
    @target_days = Date.parse('2000-01-01')..Date.parse('2000-1-31')
    @items = Item.order("id")
    @orders = Order.order("id")
  end

  def about
  end
end
