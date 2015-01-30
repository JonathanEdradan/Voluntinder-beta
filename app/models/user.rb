class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :address, :city, :state, :zipcode, presence: true

  has_many :events
  has_many :attendances
  			#method						#join table 		#what is being return
  has_many :attended_events, through: :attendances, source: :event
end
 