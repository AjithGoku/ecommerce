class StockStatusesController < ApplicationController

    def index
        @stock_statuses = StockStatus.all
        authorize! :create, @stockstatus
    end

    def show
        @stock_status = StockStatus.find(params[:id])
        authorize! :create, @stockstatus
    end

    def new   
       @stock_status = StockStatus.new
       authorize! :create, @stockstatus
    end  

    def edit
        @stock_status = StockStatus.find(params[:id])
        authorize! :create, @stockstatus
    end

    def update
        @stock_status = StockStatus.find(params[:id])
        authorize! :create, @stockstatus
        
        respond_to do |format|
            if @stock_status.update(stockstatus_params)
                format.html { redirect_to stock_statuses_path, notice: "Stock Status was updated sucessfully." } 
            else
                format.html { render :edit, status: :unprocessable_entity }
            end 
        end
    end
    
    def create
        @stock_status = StockStatus.new(stockstatus_params)
        authorize! :create, @stockstatus
        
        respond_to do |format|
            if @stock_status.save
                format.html { redirect_to stock_statuses_path, notice: "Stock Status was created sucessfully." } 
            else
                format.html { render :new, status: :unprocessable_entity }
            end  
        end
    end

    def destroy
      stockstatus = StockStatus.find(params[:id])
      authorize! :create, @stockstatus
      stockstatus.destroy
      respond_to do |format|
        format.html { redirect_to stock_statuses_path, notice: "Stock Status was successfully destroyed." }  
      end
    end

    private
    def stockstatus_params
        params.require(:stockstatus).permit(:status)
    end

end
