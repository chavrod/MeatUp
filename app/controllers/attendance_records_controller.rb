class AttendanceRecordsController < ApplicationController

  def create
    event = Event.find(params[:event_id])
    if event.attendees.include?(current_user)
      flash[:notice] = "You are already registered."
    else
      event.attendees << current_user
      flash[:notice] = "You have successfully registered."
    end
    redirect_to event
  end

  def destroy
    event = Event.find(params[:event_id])
    event.attendees.delete(current_user)
    redirect_to event, notice: 'You are no longer attending this event'
  end

end