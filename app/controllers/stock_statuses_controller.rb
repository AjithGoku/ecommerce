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
        stockstatus = StockStatus.find(params[:id])
        authorize! :create, @stockstatus
        stockstatus.update(stockstatus_params)
        respond_to do |format|
            format.html { redirect_to stock_statuses_path, notice: "Stock Status was updated sucessfully." }  
        end
    end
    
    def create
        stockstatus = StockStatus.new(stockstatus_params)
        authorize! :create, @stockstatus
        stockstatus.save
        respond_to do |format|
            format.html { redirect_to stock_statuses_path, notice: "Stock Status was created sucessfully." }  
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
