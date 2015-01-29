class EventsController < ApplicationController
before_action  :authenticate_user!
respond_to :html, :js
 
  def index
    @events = Event.all
    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
    marker.lat event.latitude
    marker.lng event.longitude
  end
end

  def show
    #grab all event_ids of user's attendances
    #then match 
    #event.random
    # @random_event = random_event(current_user)
    # binding.pry

    @user = current_user

    @event = Event.find(params[:id])

    # @attendance=Attendance.new(user_id:@user.id, event_id:@event.id) 
    @hash = Gmaps4rails.build_markers(@event) do |event, marker|
    marker.lat event.latitude
    marker.lng event.longitude
    end  
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
        respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end


  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
    format.html { redirect_to events_url, notice: 'User was successfully destroyed.' }
    format.json { head :no_content }
    end
  end

  
private
  def set_event
      @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(
      :latitude,
      :longitude,
    	:name,
    	:description,
      :date,
      :address,
      :city,
      :state,
      :zipcode,
      :user_id
    )
  end

  def random_event(user)
    offset = rand(Event.count)
    rand_record = Event.offset(offset.first)
    if user.attending.include?(event)
      random_event(user)
    end
    return event
  end



end

