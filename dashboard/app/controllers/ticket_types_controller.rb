class TicketTypesController < ApplicationController
  before_action :set_event, only: %i[ new edit create update destroy ]
  before_action :set_ticket_type, only: %i[ show edit update destroy ]

  # GET /ticket_types/new
  def new
    @ticket_type = TicketType.new(event: @event, limit_number: 1)
  end

  # GET /ticket_types/1/edit
  def edit
  end

  # POST /ticket_types or /ticket_types.json
  def create
    @ticket_type = TicketType.new(ticket_type_attributes)

    respond_to do |format|
      if @ticket_type.save
        format.html { redirect_to event_url(@event), notice: "Ticket type was successfully created." }
        format.json { render :show, status: :created, location: @ticket_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ticket_types/1 or /ticket_types/1.json
  def update
    respond_to do |format|
      if @ticket_type.update(ticket_type_attributes)
        format.html { redirect_to event_url(@event), notice: "Ticket type was successfully updated." }
        format.json { render :show, status: :ok, location: @ticket_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ticket_types/1 or /ticket_types/1.json
  def destroy
    @ticket_type.destroy

    respond_to do |format|
      format.html { redirect_to event_url(@event), notice: "Ticket type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket_type
      @ticket_type = TicketType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_type_params
      params.require(:ticket_type).permit(:name, :limit_number)
    end

    def ticket_type_attributes
      ticket_type_params.merge(event: @event)
    end

    def set_event
      @event = Event.find(params[:event_id])
    end
end
