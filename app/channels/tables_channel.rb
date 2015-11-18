class TablesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'tables'
  end
end
