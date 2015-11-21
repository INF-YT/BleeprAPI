class Order < ActiveRecord::Base
  belongs_to :card
  belongs_to :table
  after_save :stream_update

  private
    def stream_update
      unless self.table.nil?
        ActionCable.server.broadcast 'tables',
          table_id: self.table.id,
          order_id: self.id,
          status: self.status
      end
    end
end
