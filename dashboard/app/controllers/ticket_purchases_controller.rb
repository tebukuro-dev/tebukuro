class TicketPurchasesController < ApplicationController
  before_action :set_event, only: %i[ new create ]

  # GET /ticket_purchases/1 or /ticket_purchases/1.json
  def show
    @ticket_purchase = TicketPurchase.find(params[:id])
  end

  # GET /ticket_purchases/new
  def new
    @ticket_purchase = TicketPurchase.new
  end

  # POST /ticket_purchases or /ticket_purchases.json
  def create
    @ticket_purchase = TicketPurchase.new(ticket_purchase_params)

    respond_to do |format|
      if @ticket_purchase.save
        format.html { redirect_to event_ticket_purchase_url(@event, @ticket_purchase), notice: "Ticket purchase was successfully created." }
        format.json { render :show, status: :created, location: @ticket_purchase }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_event
      @event = Event.find(params[:event_id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_purchase_params
      params.require(:ticket_purchase).permit(:ticket_type_id, :number_of_purchased)
    end
end
