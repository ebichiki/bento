class OrderController < ApplicationController

  def index
    now = Time.current
    @row_headers = (now.beginning_of_month.to_date)..(now.end_of_month.to_date)
    @column_headers = Item.select(:name, :price).order(:id)
    @orders = Order.select(:id, :item_id, :date, :number)
                  .where('user_id = ? and date >= ? and date <= ? ',
                         current_user.id, now.at_beginning_of_month.to_date, now.end_of_month.to_date)
                  .order(:date, :item_id)
                  .group_by {|o| o[:date]}

  end

  def create
    print('a')
  end

  def update
    order = Order.find(params[:id])
    order.update(number: params[:order][:number])
    redirect_to root_path, notice: "注文情報を更新しました。 注文日: #{order.date}"
  end
end