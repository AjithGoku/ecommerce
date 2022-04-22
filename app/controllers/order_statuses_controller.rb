class OrderStatusesController < ApplicationController
    def index
        @order_statuses = OrderStatus.all
    end

    def show
        @order_status = OrderStatus.find(params[:id])
    end

    def new   
       @order_status = OrderStatus.new
    end  

    def edit
        @order_status = OrderStatus.find(params[:id])
    end

    def update
        @order_status = OrderStatus.find(params[:id])
        @order_status.update(orderstatus_params)
        respond_to do |format|
            format.html { redirect_to order_statuses_path, notice: "Order Status was updated sucessfully." } 
        end
    end
    
    def create
        @order_status = OrderStatus.new(orderstatus_params)
        @order_status.save
        respond_to do |format|
            format.html { redirect_to order_statuses_path, notice: "Order Status was created sucessfully." } 
        end
    end

    def destroy
      orderstatus = OrderStatus.find(params[:id])
      orderstatus.destroy
      respond_to do |format|
        format.html { redirect_to order_statuses_path, notice: "Order Status was successfully destroyed." }  
      end
    end

    private
    def orderstatus_params
        params.require(:orderstatus).permit(:status)
    end
end
