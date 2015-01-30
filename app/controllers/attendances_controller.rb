class AttendancesController < ApplicationController

  def create
    @attendance = Attendance.create(attendance_params)

    if @attendance.save
		  render json: @attendance
	  else
		  render json: @attendance.errors
	  end
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy

    respond_to do |format|
      format.html { redirect_to @attendance.event }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end
    
private
  
  def attendance_params
    params.require(:attendance).permit(
      :user_id, :event_id
    )
  end

end