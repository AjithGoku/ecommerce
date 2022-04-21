class OrderStatusesController < ApplicationController
        #Display all the orderstatuses
          def index
           @order_statuses = Orderstatus.all        
          end
        
        #show the orderitems for specific orderstatuses
          def show
            @orderstatus = Orderstatus.find(params[:id])      
          end
        
          def new
          @orderstatus = Orderstatus.new
          end
        
          def edit
            @orderstatus = Orderstatus.find(params[:id])
          end
        
          def update
            @orderstatus = Orderstatus.find(params[:id])
            @orderstatus.update(orderstatus_params)
            respond_to do |format|
              format.html { redirect_to order_statuses_path, notice: "orderstatus was successfully updated." }  
            end
          end
        
          def create
            orderstatus = Orderstatus.new(orderstatus_params)
            orderstatus.save
            respond_to do |format|
              format.html { redirect_to order_statuses_path, notice: "Orderstatus was successfully created." }
            end
          end
          
        
        #To destroy the specified order
          def destroy
            @orderstatus = Orderstatus.find(params[:id])
            @orderstatus.destroy
            respond_to do |format|
              format.html { redirect_to order_statuses_path, notice: "Orderstatus  are removed." }  
            end
          end
        
          private
          def orderstatus_params
              params.require(:orderstatus).permit(:order_status)
          end
               
end