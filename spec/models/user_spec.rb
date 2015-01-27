require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'Attributes' do
  	 it { is_expected.to respond_to :first_name }
  	 it { is_expected.to respond_to :last_name }
  	 it { is_expected.to respond_to :address }
  	 it { is_expected.to respond_to :city }
  	 it { is_expected.to respond_to :state }
  	 it { is_expected.to respond_to :zipcode }
  end

  describe 'Database' do
 		it { is_expected.to have_db_column :first_name }
  	it { is_expected.to have_db_column :last_name }
  	it { is_expected.to have_db_column :address }
  	it { is_expected.to have_db_column :city }
  	it { is_expected.to have_db_column :state }
  	it { is_expected.to have_db_column :zipcode }
  end

  describe 'Validations' do
  	it { is_expected.to validate_presence_of :first_name }
  	it { is_expected.to validate_presence_of :last_name }
  	it { is_expected.to validate_presence_of :address }
  	it { is_expected.to validate_presence_of :city }
  	it { is_expected.to validate_presence_of :state }
  	it { is_expected.to validate_presence_of :zipcode }
  end

  describe 'Associations' do
  	it { is_expected.to have_many :events }
  	it { is_expected.to have_many :attendances }
  	it { is_expected.to have_many :attended_events, through: :attendances }
  end
end
