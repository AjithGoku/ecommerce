class ProductCategoriesController < ApplicationController
    def index
        @product_categories = ProductCategory.all
    end

    def show
        @product_categories = ProductCategory.find(params[:id])
    end

    def new   
       @product_categories = ProductCategory.new   
    end  

    def edit
        @product_categories = ProductCategory.find(params[:id])
    end

    def update
        productcategory = ProductCategory.find(params[:id])
        productcategory.update(productcategory_params)
        respond_to do |format|
            format.html { redirect_to product_categories_path, notice: "Product Category was updated sucessfully." }  
        end
    end
    
    def create
        productcategory = ProductCategory.new(productcategory_params)
        productcategory.save
        respond_to do |format|
            format.html { redirect_to product_categories_path, notice: "Product Category was created sucessfully." }  
        end
    end

    def destroy
      productcategory = ProductCategory.find(params[:id])
      productcategory.destroy
      respond_to do |format|
        format.html { redirect_to product_categories_path, notice: "Product Category was successfully destroyed." }  
      end
    end

    private
    def productcategory_params
        params.require(:productcategory).permit(:name)
    end

end
