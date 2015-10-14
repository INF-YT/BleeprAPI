class CustomersController < ApplicationController
  respond_to :json
  def index
    @customers = Customer.all
    respond_with @customers
  end

  def show
    @customer = Customer.find(params[:id])
    respond_with @customer
  end

  def create
    @customer = Customer.create(customer_params)
    respond_with @customer
  end

  def update
    @customer = Customer.find(params[:id]).update_attributes(customer_params)
    respond_with @customer
  end

  def destroy
    @customer = Customer.find(params[:id]).destroy
    respond_with @customer
  end

  private
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :phone, :email)
    end
end
