class OrderController < ApplicationController
  respond_to :html
  def index
    now = Time.current
    @target_days = (now.beginning_of_month.to_date)..(now.end_of_month.to_date)
    @items = Item.order('id')
    orders = Order.where(user_id: current_user.id)

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

    end
  end

  def create
    print('a')
  end
  
  def update
    # @order = Order.where(user_id: params[:id])
    # now = Time.current
    #  (order.date - now.beginning_of_month.to_date).to_i do |days|
    #   id_list.index(order.item_id) do |item|
    #       order = Order.find_by(id: days, item_id: item)
    #       order.update_attributes(number: @monthly_lists[days][item])
    #       redirect_to request.referer
      # end
    # end
  end
end