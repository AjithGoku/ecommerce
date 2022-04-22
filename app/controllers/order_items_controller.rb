class OrderItemsController < ApplicationController
      #Display all the orderitems
      def index
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
      #redirect_to root_path
    
      def create
        orderitem = OrderItem.new(orderitem_params)

        orderitem.save
          respond_to do |format|
             format.html { redirect_to order_items_url, notice: "Orderstatus was successfully created." }  

        end
        #redirect_to root_path
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
