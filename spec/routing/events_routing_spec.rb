require "rails_helper"

RSpec.describe EventsController, type: :routing do
  it 'Creates a new event' do
    expect(post('/events')).to route_to('events#create')
  end

  it 'Show events created' do
    expect(get('/events/1')).to route_to('events#show')
  end

  it 'Destroy an event' do
    expect(delete('/events/1')).to route_to('events#destroy')
  end
end
