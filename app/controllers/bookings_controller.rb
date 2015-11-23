class BookingsController < ApplicationController
  respond_to :html

  def new
    @booking = Occupancy.new
  end

  def create
    new_params = booking_params
    new_params["customer"] = Customer.find_or_create_by(email: new_params["customer"])
    @booking = Occupancy.new(new_params)
    @booking.prebooked = true
    @tables = Table.where(capacity: new_params["covers"])
    error = false
    if @tables.count > 0
      @tables.each do |t|
        if t.free_at(@booking.start)
          @booking.table = t
          break
        end
        flash.alert = "No tables available at that time"
        error = true
      end
    else
      flash.alert = "No tables of that capacity available"
      error = true
    end
    unless error == true
      @booking.save
      respond_with @booking, location: -> {booking_url(@booking)}
    else
      respond_with @booking, location: -> {new_booking_url()}
    end
  end

  def show
    @booking = Occupancy.find(params[:id])
    respond_with @booking
  end

  private
    def booking_params
      params.require(:occupancy).permit(:start, :end, :covers, :customer)
    end
end
