class ParticipantsController < ApplicationController
  def index
    @participants = Participant.all
  end

  def create
    @participant = Participant.new
    authorize @participant
    @participant.user = current_user
    @event = Event.find(params[:event_id])
    @participant.event = @event
    if @participant.save
      @count = @event.participants.count
      respond_to do |format|
        format.html { redirect_to @event }
        format.js 
      end
    
    else
      render 'events/show'
    end
  end

  def destroy
    participant = Participant.find(params[:participant_id])
    authorize participant
    participant.destroy
    @event = Event.find(params[:event_id])
    @count = @event.participants.count
    respond_to do |format|
      format.html { redirect_to @event }
      format.js 
    end
  end

  private
  # no ne
  # def participants_params
  #   params.require(:participant).permit(:user_id, :event_id)
  # end

end
