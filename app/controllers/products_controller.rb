class ProductsController < ApplicationController
    def index
        @products = Product.all
    end

    def show
        @products = Product.find(params[:id])
    end

    def new   
       @products = Product.new   
    end  

    def edit
        @products = Product.find(params[:id])
    end

    def update
        product = Product.find(params[:id])
        product.update(product_params)
        respond_to do |format|
            format.html { redirect_to products_url, notice: "Product was successfully updated." }  
        end
    end
    
    def create
        product = Product.new(product_params)
        product.save
        respond_to do |format|
            format.html { redirect_to products_url, notice: "Product was successfully created." }  
        end
    end

    def destroy
      product = Product.find(params[:id])
      product.destroy
      respond_to do |format|
        format.html { redirect_to products_url, notice: "Product was successfully destroyed." }  
      end
    end

    private
    def product_params
        params.require(:product).permit(:name, :description, :price, :image_url, :discount_id, :stock_status_id, :product_category_id)
    end
 end


  
    

