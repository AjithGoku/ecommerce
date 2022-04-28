class EcommerceController < ApplicationController
    def index
        @orders = Order.where("user_id= ?", current_user.id)
        @product_categories=ProductCategory.all
        @stock_status=StockStatus.all
        @order_items=OrderItem.all.limit(5)
        # p @order_item
        # p @order_item.product
        # p @order_item.order
        # p @order_item.order.user
    end

    
end
