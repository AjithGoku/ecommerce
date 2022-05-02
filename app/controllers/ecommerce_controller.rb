class EcommerceController < ApplicationController

    def index
        @product_categories=ProductCategory.all.limit(4);
    end

    def orderlist
        @orderItems = OrderItem.all.joins(:product).where(:products => { :product_category_id => params[:category_id] }).order("created_at DESC").limit(4)
        p "@orderItems"
        p @orderItems
        @orderItems.each do |item|
            p "item"
            p item
            p item.product
            p item.order
            p item.order.orderstatus
            p item.order.orderstatus
        end
        respond_to do |format|
            format.js { render :partial => "ecommerce/recent_orders/order_list" }
        end
    end

end