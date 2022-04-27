class EcommerceController < ApplicationController

    def index
        @product_categories=ProductCategory.all
        p "product_categories"
        p @product_categories
        @product_categories.each do |pc|
        p "pc"
        p pc.name
        end
        @orders=Order.all
        p "orders"
        p @orders
        @orders.each do |order|
        p "Single order"
        p order.id
        end
        p "master params"
        p params
    end

    def orderlist
        p "params"
        p params
        @product = Product.find(params[:category_id])
        p "@product"
        p @product
        # @readings = OrderItem.all
        @readings = OrderItem.all.joins(:product).where(:products => { :product_category_id => params[:category_id] })
        p "@readings"
        p @readings
        @readings.each do |item|
            p "item"
            p item
            p item.product
            p item.order
            p item.order.orderstatus
        end
        # p @readings[products]

    end

end