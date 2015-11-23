class RelayController < ApplicationController
  respond_to :json, :html

  def index
  end

  def pressed
    ActionCable.server.broadcast "relay", action: params[:id]
    head :ok
  end
end
