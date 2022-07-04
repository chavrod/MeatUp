# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


  def create
    @event = Event.find(params[:id])
    if @event.attendees.include?(current_user)
      flash[:alert] = "You are already registered."
    else
      @attendance_record = AttendanceRecord.create(attended_event_id: @event.id, event_attendee_id: current_user.id)
      flash[:notice] = "You have successfully registered."
    end
    redirect_to @event
  end

  def create
    @attendance_record = AttendanceRecord.create(attended_event_id: params[:event_id], event_attendee_id: current_user.id)
    flash[:notice] = "You have successfully registered."
    redirect_to event_path(params[:event_id])
  end