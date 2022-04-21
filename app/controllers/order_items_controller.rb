class OrderItemsController < ApplicationController
      #Display all the orderitems
      def index
        @orderitems = OrderItem.all
      end
    
    #show the orderitems for specific orderitems
      def show
        @orderitem = OrderItem.find(params[:id])
    
      end
    
      def new
      @orderitem = OrderItem.new
      end
    
      def edit
        @orderitem = OrderItem.find(params[:id])
      end
    
      def update
        orderitem = OrderItem.find(params[:id])
        orderitem.update(orderitem_params)
        respond_to do |format|
            format.html { redirect_to orders_url, notice: "orderitem was successfully updated." }
        end
      end
    
      def create
        orderitem = OrderItem.new(orderitem_params)
        orderitem.save
        respond_to do |format|
          format.html { redirect_to order_url, notice: "order item was successfully created." }  
        end
      end
    
    #To destroy the specified order
      def destroy
        @orderitem = OrderItem.find(params[:id])
        @orderitem.destroy
        respond_to do |format|
          format.html { redirect_to orders_index_path, notice: "order item is removed." } 
       
          end   
      end
      
      private
    
      def orderitem_params
          params.require(:orderitem).permit(:order_id,:product_id,:actual_price,:discount_price,:final_price, :quantity)
      end
end
