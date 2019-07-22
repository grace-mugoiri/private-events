class EventsController < ApplicationController
  before_action :logged_in_user, only: [:create]
  def index
    @events = Event.all
  end

  def create
    @event = current_user.events.build(events_params)
    if @event.save
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
end
