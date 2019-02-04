class OrderController < ApplicationController
  def index
    now = Time.current
    @target_days = (now.beginning_of_month.to_date)..(now.end_of_month.to_date)
    @items = Item.order('id')
    orders = Order.order('id')

    # @monthly_lists = Array.new(@target_days.count, Array.new(@items.count, 0))
    @monthly_lists = Array.new(@target_days.count).map { Array.new(@items.count, 0)}
    print(@monthly_lists)
    id_list = []
    @items.each do |item|
      id_list.push(item.id)
    end

    orders.each do |order|
      row = (order.date - now.beginning_of_month.to_date).to_i
      col = id_list.index(order.item_id)
      @monthly_lists[row][col] = order.number
      print(row)
      print(col)
    end
    print(@monthly_lists)
  end

  def about
  end
end
