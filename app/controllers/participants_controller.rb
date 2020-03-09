class ParticipantsController < ApplicationController
  def index
    @participants = Participant.all
  end

  def create
    @participant = Participant.new
    @participant.user = current_user
    @event = Event.find(params[:event_id])
    @participant.event = @event
    if @participant.save
      redirect_to @event
    else
      render 'events/show'
    end
  end

  def destroy
    participant = Participant.find(params[:participant_id])
    participant.destroy
    event = params[:event_id]
    redirect_to event_path(event)
  end

  private
  # no ne
  # def participants_params
  #   params.require(:participant).permit(:user_id, :event_id)
  # end

end
