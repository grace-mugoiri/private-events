class EventsController < ApplicationController
  before_action :logged_in_user, only: [:create]
  def index
    @ev_future = Event.future
    @ev_past = Event.past
  end

  def create
    @event = current_user.events.build(events_params)
    if @event.save
      current_user.events_attended << @event
      if attendancy_params != [0]
        attendancy_params[0..-2].each{|user| 
        EventAttendance.create(attendee: user.to_i, attended_event: @event.id )}
      end
      flash[:success] = "Event created!"
      redirect_to root_url
    else
        render 'static_pages/home'
    end
  end

  def show
    @event= Event.find(params[:id])
  end

  def events_params
    params.require(:event).permit(:event_title, :date)
  end

  def attendancy_params
    params.require(:attendees)
  end
end
