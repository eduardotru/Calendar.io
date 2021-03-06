class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  def index
    @events = Event.where(user_id: event_params[:user_id])
    json_response(@events.order('dueDate asc').where('dueDate >= ?', DateTime.now()))
  end

  # POST /events
  def create
    puts event_params
    @event = Event.create!(event_params)
    json_response(@event)
  end

  # GET /events/:id
  def show
    json_response(@event)
  end

  # PUT /events/:id
  def update
    @event.update(event_params)
    head :no_content
  end

  # DELETE /events/:id
  def destroy
    @event.destroy
    head :no_content
  end

  private

  def event_params
    # whitelist params
    params.permit(:duration,
                  :dueDate,
                  :static,
                  :owner,
                  :event,
                  :user_id,
                  :name)
    end

    def set_event
      @event = Event.find(params[:id])
    end
  end
