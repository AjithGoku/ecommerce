class EcommerceController < ApplicationController
    def index
        @orders = Order.where("user_id= ?", current_user.id)
        
        @product_categories=ProductCategory.all
        @stock_status=StockStatus.all
        @order_status=Orderstatus.all
        @order_items=OrderItem.all.limit(5)
        @list_items =OrderItem.all.joins(:product)
    end

    def order_based_on_category
      if params[:status_id]=="Show All"
        @list_items = OrderItem.all.joins(:product)
      else
        @list_items = OrderItem.all.joins(:product).where(:products => { :product_category_id => params[:category_id] })
        p @list_items
      end
      respond_to do |format|
        format.js { render :partial => "ecommerce/product_order_list" }
      end
    end

    def order_based_on_stockstatus
      if params[:status_id]=="Show All"
        @list_items = OrderItem.all.joins(:product)
      else
        @list_items = OrderItem.all.joins(:order).where(:order => { :orderstatus_id => params[:status_id] })
        p @list_items
      end
      respond_to do |format|
        format.js { render :partial => "ecommerce/product_order_list" }
      end
    end

    def order_based_on_search
      @search_order_list = OrderItem.all.joins(:product).where("id= ?",params[:search] )

      p @search_order_list
      respond_to do |format|
        format.js { render :partial => "ecommerce/product_order_list" }
      end
    end
    
end
