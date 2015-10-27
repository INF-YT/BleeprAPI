class ButtonsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'buttons'
  end
end
