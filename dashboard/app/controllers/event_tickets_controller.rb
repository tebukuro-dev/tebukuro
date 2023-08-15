class EventTicketsController < ApplicationController
  before_action :set_event, only: %i[ new create edit update destroy ]
  before_action :set_event_ticket, only: %i[ edit update destroy ]

  # GET /event_tickets/new
  def new
    @event_ticket = EventTicket.new(event: @event)
  end

  # GET /event_tickets/1/edit
  def edit
  end

  # POST /event_tickets or /event_tickets.json
  def create
    @event_ticket = EventTicket.new(event_ticket_attributes)

    respond_to do |format|
      if @event_ticket.save
        format.html { redirect_to event_url(@event), notice: "Event ticket was successfully created." }
        format.json { render :show, status: :created, location: @event_ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_tickets/1 or /event_tickets/1.json
  def update
    respond_to do |format|
      if @event_ticket.update(event_ticket_attributes)
        format.html { redirect_to event_url(@event), notice: "Event ticket was successfully updated." }
        format.json { render :json, @event_ticket, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_tickets/1 or /event_tickets/1.json
  def destroy
    @event_ticket.destroy

    respond_to do |format|
      format.html { redirect_to event_url(@event), notice: "Event ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_ticket
      @event_ticket = EventTicket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_ticket_params
      params.require(:event_ticket).permit(:name)
    end

    def event_ticket_attributes
      event_ticket_params.merge(event_id: @event.id)
    end

    def set_event
      @event = Event.find(params[:event_id])
    end
end
