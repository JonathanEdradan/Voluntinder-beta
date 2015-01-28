require 'rails_helper'

RSpec.describe AttendancesController, :type => :controller do
      let!(:user) { FactoryGirl.create(:user) }
  # before do
  #   sign_in(user)
  # end
  # describe '#new' do   
  #   before do
  #     get :new
  #   end   
  #     it 'returns 200' do
  #       expect(response).to be_success
  #     end

  #     it 'renders attendances/new' do
  #       expect(response).to render_template 'attendances/new'
  #     end

  #     it 'assigns @attendance' do
  #       # assigns(:event) evaluates to @event
  #       expect(assigns(:attendance)).to be_a Attendance
  #       expect(assigns(:attendance)).not_to be_persisted
  #     end
  # end

  describe '#create' do
    context 'authenticated' do
        before { sign_in user }

          context 'valid params' do
            before do
                # You can pass in params to post
                post :create, attendance: {
                    event_id: 1
                }
            end

            it 'assigns @attendance' do
                expect(assigns(:attendance)).to be_a Attendance
            end

            it 'persists the attendance' do
                expect(assigns(:attendance)).to be_persisted
            end

            it 'redirects to the attendance' do
                expect(response).to have_http_status :success
            end
        end
        context 'invalid params' do
              before do
                post :create, attendance: {
                  event_id: nil
              }
          end

          it 'assigns @attendance' do
              expect(assigns(:attendance)).to be_a Attendance
          end

          it 'does not persist the attendance' do
              expect(assigns(:attendance)).not_to be_persisted
          end

          it 'renders attendances/new' do
              expect(response).to have_http_status :success
          end
        end
    end

    context 'not authenticated' do
        # post anything will redirect to root
        pending
    end
      
end

  # describe '#destroy' do
  #     let!(:attendance) {
  #       FactoryGirl.create(:attendance)
  #     }
  #     it 'destroys a attendance' do
  #         expect { delete :destroy, id: attendance.id}.to change(Attendance, :count).by(-1)
  #       end
  #     it 'redirects to #index' do
  #         delete :destroy, id: attendance.id
  #         expect(response).to redirect_to attendances_path
  #       end
  #   end

end
