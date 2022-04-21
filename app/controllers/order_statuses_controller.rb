class OrderStatusesController < ApplicationController
        #Display all the ordersstatuses
          def index
           @ordersstatuses = Orderstatus.all
  
        
          end
        
        #show the orderitems for specific orderstatuses
          def show
            @ordersstatuses = Orderstatus.find(params[:id])
            
        
          end
        
          def new
          @ordersstatuses = Orderstatus.new
          authorize! :new, @orderstatuses


          end
        
          def edit
            @orderstatuses = Orderstatus.find(params[:id])
            authorize! :edit, @orderstatuses


          end
        
          def update
            ordersstatuses = Orderstatus.find(params[:id])
            authorize! :update, @orderstatuses

            ordersstatuses.update(orderstatus_params)
            respond_to do |format|
              if @orderstatuses.save


              format.html { redirect_to order_status_url, notice: "orderstatus was successfully updated." }  
            else

              format.html { render :edit, status: :unprocessable_entity }
  
          end
  
      end  
            end
          
        
          def create
            ordersstatuses = Orderstatus.new(orderstatus_params)
            #ordersstatuses.save
            respond_to do |format|
              if @orderestatuses.save


              format.html { redirect_to orders_status_path, notice: "Orderstatus was successfully created." }  
            else

              format.html { render :edit, status: :unprocessable_entity }
  
          end
  
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
        

