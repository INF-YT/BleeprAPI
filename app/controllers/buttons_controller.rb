class ButtonsController < ApplicationController
  respond_to :json

  def call_waiter
    client = Washbullet::Client.new(Rails.application.secrets.pushbullet_key)
    client.push_note(
      receiver:   :device, # :email, :channel, :client
      identifier: Rails.application.secrets.pushbullet_id,
      params: {
        title: 'Table Requires Assistance',
        body:  "Please visit table #{Table.find(params[:id]).name}"
      }
    )
    head :ok
  end

  def request_bill
    client = Washbullet::Client.new(Rails.application.secrets.pushbullet_key)
    client.push_note(
      receiver:   :device, # :email, :channel, :client
      identifier: Rails.application.secrets.pushbullet_id,
      params: {
        title: 'Table Needs Bill',
        body:  "Please visit table #{Table.find(params[:id]).name}"
      }
    )
    head :ok
  end

  def leave_table
    Table.find(params[:id]).occupancies.each do |o|
      o.occupied = false
      o.end = Time.now
      o.save
    end
    head :ok
  end

end
