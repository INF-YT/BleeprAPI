class OrdersController < ApplicationController
  respond_to :json
  def index
    @orders = Order.all
    respond_with @orders
  end

  def open
    @orders = Order.where(status: "open")
    respond_with @orders
  end

  def progress
    @orders = Order.where(status: "pending")
    respond_with @orders
  end

  def show
    @order = Order.find(params[:id])
    respond_with @order
  end

  def create
    @order = Order.create(order_params)
    respond_with @order, location: -> {order_path(@order)}
  end

  def update
    @order = Order.find(params[:id]).update_attributes(order_params)
    respond_with @order, location: -> {order_path(@order)}
  end

  def destroy
    @order = Order.find(params[:id]).destroy
    respond_with @order
  end

  private
    def order_params
      params.require(:order).permit(:customer_id, :card_id, :status, :feedback)
    end
end
