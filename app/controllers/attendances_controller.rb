class AttendancesController < ApplicationController
	
	#routing tests
		#/attendaces
		#post request
	#controller test
		#create action
	# def create
	# 	@event_id@event.find(params[:id])
	# 	@user_id=current_user
	# 	@attendance = Attendance.new(event_id, user_id)
	# end

  def create
    @attendance = Attendance.new(attendance_params)
    @attendance.user = current_user
    if @attendance.save
		render json: @attendance
	else
		render json: @attendance.errors
	end
  end


private
  
  def attendance_params
    params.require(:attendance).permit(
      :event_id
    )
  end

		# @attendace = Attendance.new with event_id params event_id user_id -- current_user
		#attendance@attendance.name

end
