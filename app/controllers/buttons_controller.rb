class ButtonsController < ApplicationController
  respond_to :json, :html

  def index
  end

  def pressed
    ActionCable.server.broadcast "buttons", button: params[:id]
    head :ok
  end
end
