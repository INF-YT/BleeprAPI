class CardsController < ApplicationController
  respond_to :json
  def index
    @cards = Card.where(customer_id: params[:customer_id])
    respond_with @cards
  end

  def show
    @card = Card.find(params[:id])
    respond_with @card
  end

  def create
    @card = Customer.find(params[:customer_id]).cards.create(card_params)
    respond_with @card
  end

  def update
    @card = Card.find(params[:id]).update_attributes(card_params)
    respond_with @card
  end

  def destroy
    @card = Card.find(params[:id]).destroy
    respond_with @card
  end

  private
    def card_params
      params.require(:card).permit(:id, :customer_id)
    end
end
