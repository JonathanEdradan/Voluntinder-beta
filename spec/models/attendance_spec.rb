require 'rails_helper'

RSpec.describe Attendance, :type => :model do
  describe 'Associations' do
    it { is_expected.to belongs_to :events }
    it { is_expected.to belongs_to :user }
  end

  describe 'Attributes' do
    it { is_expected.to respond_to :user_id }
    it { is_expected.to respond_to :event_id }
  end

  describe 'Database' do
    it { is_expected.to have_db_column :user_id }
    it { is_expected.to have_db_column :event_id }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :user_id }
    it { is_expected.to validate_presence_of :event_id }
  end

end
