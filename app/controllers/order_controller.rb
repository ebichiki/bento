class OrderController < ApplicationController

  def update
    order = Order.find(params[:id])
    order.update(number: params[:order][:number])
  end
end