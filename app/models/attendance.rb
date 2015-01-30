class Attendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  validates :user_id, presence: true, uniqueness: { scope: :event_id }
  validates :event_id, presence: true
  # validates_uniqueness_of 
end
