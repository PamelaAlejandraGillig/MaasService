# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SigninController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  describe 'POST #create' do
    it 'returns unauthorized for invalid params' do
      post :create, params: { email: user.email, password: 'incorrect' }
      expect(response).to have_http_status(401)
    end
  end

  describe 'logout DELETE #destroy' do
    context 'failure' do
      it 'returns unauthorized http status' do
        delete :destroy
        expect(response).to have_http_status(401)
      end
    end
    context 'success' do
      it 'returns http success with valid tokens' do
        payload = { user_id: user.id }

        session = JWTSessions::Session.new(
          payload: payload,
          refresh_by_access_allowed: true,
          namespace: "user_#{user.id}"
        )

        tokens = session.login
        request.cookies[JWTSessions.access_cookie] = tokens[:access]
        request.headers[JWTSessions.csrf_header] = tokens[:csrf]

        delete :destroy
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body)).to eq('ok')
      end
    end
  end
end
