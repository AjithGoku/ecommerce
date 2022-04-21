class ProductsController < ApplicationController
    def index
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])
    end

    def new   
       @product = Product.new
       authorize! :new, @product
    end  

    def edit
        @product = Product.find(params[:id])
        authorize! :edit, @product
    end

    def update
        @product = Product.find(params[:id])
        authorize! :update, @product
        
        respond_to do |format|
            if @product.update(product_params)
                format.html { redirect_to products_url, notice: "Product was successfully updated." }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end
    
    def create
        @product = Product.new(product_params)
        authorize! :create, @product
        #product.save
        respond_to do |format|
            if @product.save
                format.html { redirect_to products_url, notice: "Product was successfully created." }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    def destroy
      product = Product.find(params[:id])
      authorize! :create, @product
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
