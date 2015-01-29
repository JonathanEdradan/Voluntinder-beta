class ChangeAttendanceIdStringsToIntegers < ActiveRecord::Migration
  def change
  	change_column :attendances, :user_id, :integer
  	change_column :attendances, :event_id, :integer
  end
end
