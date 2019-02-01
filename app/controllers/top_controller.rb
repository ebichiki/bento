class TopController < ApplicationController
  def index
    @orders = Order.order("id")
  end

  def about
  end
end
