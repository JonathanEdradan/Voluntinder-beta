require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let!(:user) {FactoryGirl.create(:user)}
  before do
    sign_in(user)
  end
  describe '#new' do   
    before do
      get :new
    end   
      it 'returns 200' do
        expect(response).to be_success
      end
      
      it 'renders events/new' do
        expect(response).to render_template 'events/new'
      end
      
      it 'assigns @event' do
        # assigns(:event) evaluates to @event
        expect(assigns(:event)).to be_a Event
        expect(assigns(:event)).not_to be_persisted
      end
  end
  describe '#create' do
      context 'valid params' do
          before do
            # You can pass in params to post
            post :create, event: {
              name: 'foo',
              description: 'bar',
              date: Date.today,
              address: '225 Bush Street',
              city: 'San Francisco',
              state: 'CA',
              zipcode: '94104'
            }
          end
          it 'assigns @event' do
            expect(assigns(:event)).to be_a Event
          end
          it 'persists the event' do
            expect(assigns(:event)).to be_persisted
          end
          it 'redirects to the event' do
            expect(response).to redirect_to event_path(Event.last)
          end
      end
      context 'invalid params' do
	      before do
	        post :create, event: {
              name: '',
              description: '',
              date: '',
              address: '',
              city: '',
              state: '',
              zipcode: ''
            }
	      end
	      it 'assigns @event' do
	          expect(assigns(:event)).to be_a Event
	      end
	      it 'does not persist the event' do
	          expect(assigns(:event)).not_to be_persisted
	      end
	      it 'renders events/new' do
	          expect(response).to render_template 'events/new'
	      end
	  end
  end
  describe '#show' do
      let!(:event) { FactoryGirl.create(:event) }
      before { get :show, id: event.id }
      it 'returns 200' do
          expect(response).to be_success
        end
      it 'assigns @event' do
          expect(assigns(:event)).to eq event
          expect(assigns(:event)).to be_persisted
        end
      it 'renders events/show' do
          expect(response).to render_template 'events/show'
        end
    end
  describe '#index' do
      before(:example) do
        get :index
      end
      before(:context) do
        FactoryGirl.create(:event)
      end
      it 'returns 200' do
          expect(response).to be_success
        end
      it 'renders events/index' do
          expect(response).to render_template 'events/index'
        end
      it 'assigns @events' do
          expect(assigns(:events)).to eq Event.all
        end
    end
  describe '#edit' do
      let!(:event) {
        FactoryGirl.create(:event)
      }
      before {
        get :edit,
        id: event.id
      }
      it 'returns 200' do
          expect(response).to be_success
        end
      it 'assigns @event' do
          expect(assigns(:event)).to eq event
        end
      it 'renders events/edit' do
          expect(response).to render_template 'events/edit'
        end
    end
  describe '#update' do
      let!(:event) {
        FactoryGirl.create(:event)
      }
      context 'valid params' do
          before do
              patch :update, id: event.id, event: {
                name: 'bar',
                description: 'foo',
                date: (Date.today + 1.day),
                address: '1600 Pennsylvania Ave NW',
                city: 'Washington',
                state: 'DC',
                zipcode: '20500'
              }
            end

          it 'updates the event' do
              event = assigns(:event).reload
              expect(event.name).to eq 'bar'
              expect(event.description).to eq 'foo'
              expect(event.date).to eq (Date.today + 1.day)
              expect(event.address).to eq '1600 Pennsylvania Ave NW'
              expect(event.city).to eq 'Washington'
              expect(event.state).to eq 'DC'
              expect(event.zipcode).to eq '20500'
            end
          it 'assigns @event' do
              expect(assigns(:event)).to eq event
            end
          it 'redirects to the event' do
              expect(response).to redirect_to event_path(event)
            end
        end
      context 'invalid params' do
          before  do
              patch :update, id: event.id, event: {name: '',description: '',date: '',address: '',city: '', state: '',zipcode: ''}
            end
          it 'does not update the event' do
              event = assigns(:event).reload
              expect(event.name).not_to eq ''
              expect(event.description).not_to eq ''
              expect(event.date).not_to eq ''
              expect(event.address).not_to eq ''
              expect(event.city).not_to eq ''
              expect(event.state).not_to eq ''
              expect(event.zipcode).not_to eq ''
            end
          it 'assigns @event' do
              expect(assigns(:event)).to eq event
            end
          it 'renders events/edit' do
              expect(response).to render_template 'events/edit'
            end
        end
    end
  describe '#destroy' do
      let!(:event) {
        FactoryGirl.create(:event)
      }
      it 'destroys a event' do
          expect { delete :destroy, id: event.id}.to change(Event, :count).by(-1)
        end
      it 'redirects to #index' do
          delete :destroy, id: event.id
          expect(response).to redirect_to events_path
        end
    end
end