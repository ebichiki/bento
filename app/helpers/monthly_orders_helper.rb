module MonthlyOrdersHelper
  def edit_month(month)
    Date.strptime(month + '01', '%Y%m%d').strftime('%Y-%m')
  end

  def past?(target_day)
    target_day <= Date.today
  end
end
