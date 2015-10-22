class CustomersChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'customers'
  end
end
