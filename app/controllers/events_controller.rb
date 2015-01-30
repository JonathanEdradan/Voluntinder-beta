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

    @events = Event.order("name").page(params[:id]).per_page(1)

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
  #   @attendance = Attendance.find(attendance_params[:id])
  #   @attendance.destroy

  #   respond_to do |format|
  #     format.html { redirect_to root_url }
  #     format.json { head :no_content }
  #     format.js   { render :layout => false }
  #   end
  # end
    @event = Event.find(event_params[:id])
    @event.destroy
    respond_to do |format|
    format.html { redirect_to root_url, notice: 'User was successfully destroyed.' }
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


end

