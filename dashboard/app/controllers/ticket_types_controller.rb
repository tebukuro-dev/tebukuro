class TicketTypesController < ApplicationController
  before_action :set_ticket_type, only: %i[ edit update destroy ]

  # GET /ticket_types/new
  def new
    @ticket_type = TicketType.new(event: event, limit_number: 1)
  end

  # GET /ticket_types/1/edit
  def edit
  end

  # POST /ticket_types or /ticket_types.json
  def create
    @ticket_type = TicketType.new(create_ticket_type_params)

    respond_to do |format|
      if @ticket_type.save
        format.html { redirect_to event_url(@ticket_type.event), notice: "Ticket type was successfully created." }
        format.json { render json: @ticket_type, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ticket_types/1 or /ticket_types/1.json
  def update
    respond_to do |format|
      if @ticket_type.update(ticket_type_params)
        format.html { redirect_to event_url(@ticket_type.event), notice: "Ticket type was successfully updated." }
        format.json { render json: @ticket_type, status: :ok }
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
      format.html { redirect_to event_url(@ticket_type.event), notice: "Ticket type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket_type
      @ticket_type = TicketType.find_by!(id: params[:id], event_id: params[:event_id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_type_params
      params.require(:ticket_type).permit(:name, :limit_number)
    end

    def create_ticket_type_params
      ticket_type_params.merge(event: event)
    end

    def event
      Event.find(params[:event_id])
    end
end
