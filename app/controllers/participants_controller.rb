class ParticipantsController < ApplicationController
  def create_or_destroy
    if(Participant.find_by_user_and_event(current_user, params[:event]))
      Participant.create(user: current_user, event: params[:event])
    else
      Participant.destroy(user:current_user, event: params[:event])
    end
  end
end
