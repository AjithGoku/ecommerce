class EcommerceController < ApplicationController
    def index
        @totalprice= Order.sum(:total_price)
        @totalorders=Order.count
        @totalusers=User.count
        @totalproducts=Product.count
        @data=Order.group(Arel.sql("STRFTIME('%Y-%m-%d', created_at)")).pluck(Arel.sql("STRFTIME('%Y-%m-%d', created_at) as created_at, sum(total_price)"))
        @average_data=Order.group("STRFTIME('%Y-%m-%d', created_at)").pluck(Arel.sql("STRFTIME('%Y-%m-%d', created_at) as created_at, avg(total_price)"))
        @p=Product.first(7)
        @ordergoal=200
        @orderpercent= (@totalorders*100)/@ordergoal
        @salesgoal=100000
        @sales_difference=@salesgoal-@totalprice
        @total_average_sales= (@totalprice/@totalorders).round() 
        @product_categories=ProductCategory.all
        @stock_status=StockStatus.all 
    end
end
