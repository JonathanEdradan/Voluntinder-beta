class Event < ActiveRecord::Base
	has_many :users, through: :attendances 
	belongs_to :user
	validates :name, presence: true
	validates :description, presence: true
	validates :date, presence: true
	validates :address, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zipcode, presence: true
end
