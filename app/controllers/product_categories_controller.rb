class ProductCategoriesController < ApplicationController
    def index
        @product_categories = ProductCategory.all
        authorize! :create, @productcategory
    end

    def show
        @product_category = ProductCategory.find(params[:id])
        authorize! :create, @productcategory
    end

    def new   
       @product_category = ProductCategory.new
       authorize! :create, @productcategory
    end  

    def edit
        @product_category = ProductCategory.find(params[:id])
        authorize! :create, @productcategory
    end

    def update
        @product_category = ProductCategory.find(params[:id])
        authorize! :create, @productcategory
        
        respond_to do |format|
            if @product_category.update(productcategory_params)
                format.html { redirect_to product_categories_path, notice: "Product Category was updated sucessfully." }  
            else
                format.html { render :edit, status: :unprocessable_entity }
            end 
        end
    end
    
    def create
        @product_category = ProductCategory.new(productcategory_params)
        authorize! :create, @productcategory
        
        respond_to do |format|
            if @product_category.save
                format.html { redirect_to product_categories_path, notice: "Product Category was created sucessfully." }  
            else
                format.html { render :new, status: :unprocessable_entity }
            end 
        end
    end

    def destroy
      productcategory = ProductCategory.find(params[:id])
      authorize! :create, @productcategory
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
