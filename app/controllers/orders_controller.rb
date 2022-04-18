class OrdersController < ApplicationController

#Display all the orders
  def index
    @orders = Order.all
  end

#show the orderitems for specific order
  def show
    @orders = Order.find(params[:id])
    @orderitem = OrderItem.where("order_id = ?", params[:id])
  end

  def new

  end

  def edit
    @orders = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to root_path
  end

  def create
    order = Order.new(employee_params)
    order.save
    redirect_to root_path
  end

#To destroy the specified order
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_index_path, notice: "Order and associated order items are removed." }  
    end
  end

  private

  def order_params
      params.require(:order).permit(:name, :position)
  end

end
