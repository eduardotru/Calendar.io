class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  def index
    @events = Event.all
    json_response(@events)
  end

  # POST /events
  def create
    puts "Hola"
    puts event_params
    @event = Event.create!(event_params)
    json_response(@event, :id)
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
                  :user_id)
    end

    def set_event
      @event = Event.find(params[:id])
    end
  end
