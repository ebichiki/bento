class MonthlyOrdersController < ApplicationController

  def index
    now = Date.today.strftime('%Y%m')
    redirect_to action: :show, yyyymm: now
  end
  
  def show
    now = Date.strptime(params[:yyyymm]+"01",'%Y%m%d')
    @lastmonth = now.last_month.strftime("%Y%m")
    @nextmonth = now.next_month.strftime("%Y%m")
    @row_headers = (now.beginning_of_month.to_date)..(now.end_of_month.to_date)
    @column_headers = Item.select(:name, :price).order(:id)
    monthlyorders = Order.where('user_id = ? and date >= ? and date <= ? ',
                         current_user.id, now.at_beginning_of_month.to_date, now.end_of_month.to_date).count
    if monthlyorders == 0
      create_monthlyorders(params[:yyyymm])
    end
    @orders = Order.select(:id, :item_id, :date, :number)
                  .where('user_id = ? and date >= ? and date <= ? ',
                         current_user.id, now.at_beginning_of_month.to_date, now.end_of_month.to_date)
                  .order(:date, :item_id)
                  .group_by {|o| o[:date]}
  end

  def create_monthlyorders(yyyymm)
    month = Date.strptime(yyyymm+"01",'%Y%m%d')
    (month.beginning_of_month.to_date..month.end_of_month.to_date).each do |days|
      Order.transaction do
        Item.all.each do |item|
          Order.create!(
            [
              {
                date: days,
                number: 0,
                item_id: item.id,
                user_id: current_user.id
              }
            ]
          )
        end
      end
    end   
  end

  def nextmonth
    now = Date.strptime(params[:yyyymm]+"01",'%Y%m%d')
    redirect_to action: :show, yyyymm: now
  end
end
