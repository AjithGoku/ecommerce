class OrderStatusesController < ApplicationController
        #Display all the ordersstatuses
          def index
            @ordersstatuses = Orderstatus.all        
          end
        
          def show
            @ordersstatuses = Orderstatus.find(params[:id])
          end
        
          def new
          @ordersstatuses = Orderstatus.new
          end
        
          def edit
            @ordersstatuses = Orderstatus.find(params[:id])
          end
        
          def update
            ordersstatuses = Orderstatus.find(params[:id])
            ordersstatuses.update(orderstatus_params)
              respond_to do |format|
                format.html { redirect_to order_statuses_path, notice: "orderstatus was successfully updated." }  
              end  
          end
          
          def create
            orderstatuses = Orderstatus.new(orderstatus_params)
            orderstatuses.save
                respond_to do |format|
                  format.html { redirect_to order_statuses_path, notice: "Orderstatus was successfully created." }  
               end  
          end
        #redirect_to root_path
          
        #To destroy the specified order
          def destroy
            @ordersstatuses = Orderstatus.find(params[:id])
            @ordersstatuses.destroy
                respond_to do |format|
                  format.html { redirect_to order_status_path, notice: "Orderstatus  are removed." }  
               end
          end
        
          private
        
            def orderstatus_params
              params.require(:orderstatus).permit(:order_status)
            end
          end
        

