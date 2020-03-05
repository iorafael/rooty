class ParticipantsController < ApplicationController
  def index
    @participants = Participant.all
  end

  def create
    @participant = Participant.create(participants_params)
  end

  def destroy
    @participant = Participant.find(params[:id])
    @participant.destroy
  end

  private

  def participants_params
    params.require(:participant).permit(:user_id, :event_id)
  end

end
