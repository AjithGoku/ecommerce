class DiscountsController < ApplicationController
    def index
        @discounts = Discount.all
    end

    def show
        @discounts = Discount.find(params[:id])
    end

    def new   
       @discounts = Discount.new   
    end  

    def edit
        @discounts = Discount.find(params[:id])
    end

    def update
        discount = Discount.find(params[:id])
        discount.update(discount_params)
        respond_to do |format|
            format.html { redirect_to discounts_path, notice: "Discount Percentage was updated sucessfully." }  
        end
    end
    
    def create
        discount = Discount.new(discount_params)
        discount.save
        respond_to do |format|
            format.html { redirect_to discounts_path, notice: "Discount Percentage was created sucessfully." }  
        end
    end

    def destroy
      discount = Discount.find(params[:id])
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
