class DiscountsController < ApplicationController
    def index
        @discounts = Discount.all
        authorize! :create, @discount
    end

    def show
        @discount = Discount.find(params[:id])
        authorize! :create, @discount
    end

    def new   
       @discount = Discount.new
       authorize! :create, @discount
    end  

    def edit
        @discount = Discount.find(params[:id])
        authorize! :create, @discount
    end

    def update
        @discount = Discount.find(params[:id])
        authorize! :create, @discount
        
        respond_to do |format|
            if @discount.update(discount_params)
                format.html { redirect_to discounts_path, notice: "Discount Percentage was updated sucessfully." } 
            else
                format.html { render :edit, status: :unprocessable_entity }
            end 
        end
    end
    
    def create
        @discount = Discount.new(discount_params)
        authorize! :create, @discount
        
        respond_to do |format|
            if @discount.save
                format.html { redirect_to discounts_path, notice: "Discount Percentage was created sucessfully." } 
            else
                format.html { render :new, status: :unprocessable_entity }
            end 
        end
    end

    def destroy
      discount = Discount.find(params[:id])
      authorize! :create, @discount
      discount.destroy
      respond_to do |format|
        format.html { redirect_to discounts_path, notice: "Discount entry was successfully destroyed." }  
      end
    end

    private
    def discount_params
        params.require(:discount).permit(:percentage)
    end
end
