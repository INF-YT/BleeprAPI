class OccupanciesController < ApplicationController
  respond_to :json
  def index
    @occupancies = Table.find(params[:table_id]).occupancies
    respond_with @occupancies
  end

  def current
    @occupancies = Table.find(params[:table_id]).occupancies.where(occupied: true)
    respond_with @occupancies
  end

  def bookings
    @occupancies = Table.find(params[:table_id]).occupancies.where(prebooked: true)
    respond_with @occupancies
  end

  def show
    @occupancy = Occupancy.find(params[:id])
    respond_with @occupancy
  end

  def create
    @occupancy = Table.find(params[:table_id]).occupancies.create(table_params)
    respond_with @occupancy, location: -> {table_occupancies_path(@occupancy.table, @occupancy)}
  end

  def update
    @occupancy = Occupancy.find(params[:id])
    @occupancy.update_attributes(table_params)
    respond_with @occupancy, location: -> {table_occupancies_path(@occupancy.table, @occupancy)}
  end

  def destroy
    @occupancy = Occupancy.find(params[:id]).destroy
    head :ok
  end

  private
    def table_params
      params.require(:occupancy).permit(:prebooked, :start, :end, :customer_id, :occupied)
    end
end
