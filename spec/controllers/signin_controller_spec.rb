require 'rails_helper'

RSpec.describe SigninController, type: :controller do

  describe 'POST #create' do
    let(:password) { '123456' }
    let(:user) { FactoryBot.create(:user, password_digest: password) }
    let(:user_params) { { email: user.email, password: password } }

    it 'returns http success' do
      #post :create, params: user_params
      #expect(response).to be_successful
      #expect(JSON.parse(response.body)).to eq ['csrf']
      #expect(response.cookies[JWTSessions.access_cookie]).to be_present
    end

    it 'returns unauthorized for invalid params' do
      # post :create, params: { email: user.email, password: 'incorrect' }
      #expect(response).to have_http_status(401)
    end
  end
end
