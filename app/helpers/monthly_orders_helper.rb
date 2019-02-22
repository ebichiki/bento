module MonthlyOrdersHelper
  def editMonth(month)
    Date.strptime(month + "01",'%Y%m%d').strftime("%Y-%m")
  end
end
