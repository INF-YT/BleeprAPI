class CustomerOrdersController < ApplicationController
  respond_to :json
  def index
    @orders = Customer.find(params[:customer_id]).orders
    respond_with @orders
  end

  def show
    @order = Order.find(params[:id])
    respond_with @order
  end

  def create
    @order = Customer.find(params[:customer_id]).cards.first.orders.create(order_params)
    respond_with @order
  end

  def update
    @order = Order.find(params[:id]).update_attributes(order_params)
    respond_with @order
  end

  def destroy
    @order = Order.find(params[:id]).destroy
    respond_with @order
  end

  private
    def order_params
      params.require(:order).permit(:customer_id, :card_id)
    end
end
