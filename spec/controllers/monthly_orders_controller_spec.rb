require 'rails_helper'

RSpec.describe MonthlyOrdersController, type: :controller do

  describe '#index' do
    context 'as an authorized user' do
      before do
        @user = FactoryBot.create(:user)
      end
      it 'returns a 302 response' do
        sign_in @user
        get :index
        expect(response).to have_http_status '302'
      end
      it 'redirects the page to /monthly_orders/yyyymm' do
        sign_in @user
        now = Date.today.strftime('%Y%m')
        get :index
        expect(response).to redirect_to '/monthly_orders/' + now
      end
    end

    context 'as a guest user' do
      before do
        @user = FactoryBot.create(:user)
      end
      it 'returns a 302 response' do
        get :index
        expect(response).to have_http_status '302'
      end
      it 'redirects the page to /users/sign_in' do
        get :index
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '#show' do
    context 'as an authorized user' do
      before do
        @user = FactoryBot.create(:user)
      end
      it 'responds successfully' do
        sign_in @user
        get :show, params: { yyyymm: '201902' }
        expect(response).to be_successful
      end
      it 'returns a 200 response' do
        sign_in @user
        get :show, params: { yyyymm: '201902' }
        expect(response).to have_http_status '200'
      end
    end

    context 'as a guest user' do
      before do
        @user = FactoryBot.create(:user)
      end
      it 'does not respond successfully' do
        get :show, params: { yyyymm: '201902' }
        expect(response).to_not be_successful
      end
      it 'returns a 302 response' do
        get :show, params: { yyyymm: '201902' }
        expect(response).to have_http_status '302'
      end
      it 'redirects the page to /users/sign_in' do
        get :show, params: { yyyymm: '201902' }
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end
end
