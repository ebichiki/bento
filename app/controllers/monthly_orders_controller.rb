class MonthlyOrdersController < ApplicationController

  def index
    now = Date.today.strftime('%Y%m')
    redirect_to action: :show, yyyymm: now
  end
  
  def show
    now = Date.strptime(params[:yyyymm]+"01",'%Y%m%d')
    @row_headers = (now.beginning_of_month.to_date)..(now.end_of_month.to_date)
    @column_headers = Item.select(:name, :price).order(:id)
    @orders = Order.select(:id, :item_id, :date, :number)
                  .where('user_id = ? and date >= ? and date <= ? ',
                         current_user.id, now.at_beginning_of_month.to_date, now.end_of_month.to_date)
                  .order(:date, :item_id)
                  .group_by {|o| o[:date]}
  end

end
