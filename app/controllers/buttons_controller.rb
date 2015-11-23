class ButtonsController < ApplicationController
  respond_to :json

  def call_waiter
    head :ok
  end

  def request_bill
    head :ok
  end

  def leave_table
    Table.find(params[:id]).occupancies.each do |o|
      o.occupied = false
      o.save
    end
    head :ok
  end

end
