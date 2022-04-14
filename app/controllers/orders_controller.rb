class OrdersController < ApplicationController

def index

    @orders = Order.all

  end



  def show

    @orders = OrderItem.find(params[:id])

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

#   def create

#     order = Order.new(employee_params)

#     order.save

#     redirect_to root_path

# end

def destroy

  order = Order.find(params[:id])

  order.destroy

  redirect_to root_path

end

# private

# def order_params

#     params.require(:order).permit(:name, :position)

# end

end
