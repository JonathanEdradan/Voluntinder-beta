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

def destroy
    @attendance = Attendance.find(params[:id])
    if @attendance.present?
       @attendance.destroy
    end
    redirect_to root_url
end
    

  end



private
  
  def attendance_params
    params.require(:attendance).permit(
      :user_id, :event_id
    )
  end


end
