class BleeprsController < ApplicationController
  respond_to :json
  def index
    @bleeprs = Bleepr.all
    respond_with @bleeprs
  end

  def show
    @bleepr = Bleepr.find(params[:id])
    respond_with @bleepr
  end

  def create
    @bleepr = Bleepr.create(bleepr_params)
    respond_with @bleepr
  end

  def update
    @bleepr = Bleepr.find(params[:id]).update_attributes(bleepr_params)
    respond_with @bleepr
  end

  def destroy
    @bleepr = Bleepr.find(params[:id]).destroy
    respond_with @bleepr
  end

  private
    def bleepr_params
      params.require(:bleepr).permit(:id, :is_active, :table_id)
    end
end
