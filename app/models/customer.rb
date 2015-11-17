class Customer < ActiveRecord::Base
  has_many :cards
  has_many :orders, through: :cards
  after_save :stream_update

  private
    def stream_update
      ActionCable.server.broadcast 'customers',
        customer_id: self.id
    end
end
