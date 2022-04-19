class OrdersController < ApplicationController

#Display all the orders
  def index
    @orders = Order.where("user_id= ?", current_user.id)

  end

#show the orderitems for specific order
  def show
    @orders = Order.find(params[:id])
    @orderitem = OrderItem.where("order_id = ?", params[:id])

  end

  def new
  @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "order was successfully updated." }  
  end
    #redirect_to root_path
  end

  def create
    order = Order.new(order_params)
    order.save
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully created." }  
  end
    #redirect_to root_path
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
      params.require(:order).permit(:user_id, :total_price, :orderstatus_id)
  end

end
