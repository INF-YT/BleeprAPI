class RelayChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'relay'
  end
end
