require "rails_helper"

RSpec.describe AttendancesController, type: :routing do
  it 'it posts the attendaces' do
    expect(post('/attendances')).to route_to('attendances#create')
  end
end