class OrderController < ApplicationController

  def update
    order = Order.find(params[:id])
    order.update(number: params[:order][:number])
    # redirect_to root_path, notice: "注文情報を更新しました。 注文日: #{order.date}"
  end
end