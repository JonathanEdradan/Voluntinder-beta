require 'rails_helper'

RSpec.describe Event, type: :model do
	describe 'Attributes' do
		it { is_expected.to respond_to :name }
		it { is_expected.to respond_to :description }
		it { is_expected.to respond_to :date }
		it { is_expected.to respond_to :address }
		it { is_expected.to respond_to :city }
		it { is_expected.to respond_to :state }
		it { is_expected.to respond_to :zipcode }
	end

	describe 'Database' do
  	it { is_expected.to have_db_column :name }
  	it { is_expected.to have_db_column :description }
  	it { is_expected.to have_db_column :date }
  	it { is_expected.to have_db_column :address }
  	it { is_expected.to have_db_column :city }
  	it { is_expected.to have_db_column :state }
  	it { is_expected.to have_db_column :zipcode }
  end

  describe 'Validations' do
  	it { is_expected.to validate_presence_of :name }
  	it { is_expected.to validate_presence_of :description }
  	it { is_expected.to validate_presence_of :date }
  	it { is_expected.to validate_presence_of :address }
  	it { is_expected.to validate_presence_of :city }
  	it { is_expected.to validate_presence_of :state }
  	it { is_expected.to validate_presence_of :zipcode }
  end

  describe 'Associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many(:users).through(:attendances) }
  end
end
