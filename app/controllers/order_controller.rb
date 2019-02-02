class OrderController < ApplicationController
  def index
    
    now = Time.current
    @target_days = (now.beginning_of_month.to_date)..(now.end_of_month.to_date)
    @items = Item.order("id")
    @orders = Order.order("id")
  end

  def about
  end
end
