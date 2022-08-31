# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::TurnsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  before do
    payload = { user_id: user.id }
    session = JWTSessions::Session.new(payload: payload)
    @tokens = session.login
  end

  let(:company) { FactoryBot.create(:company) }
  let(:contract) { FactoryBot.create(:contract, company: company) }
  let(:turn) { FactoryBot.create(:turn, contract: contract, week: 14) }
  let(:registration) { FactoryBot.create(:registration, turn: turn, user: user) }

  describe 'GET #get_turns' do
    it 'returns http success' do
      request.cookies[JWTSessions.access_cookie] = @tokens[:access]
      params = { id: contract.id }
      get :get_turns, params: params, format: :json
      expect(response).to have_http_status(:success)
    end
    it 'unauth without cookie' do
      get :get_turns
      expect(response).to have_http_status(401)
    end
  end

  describe 'GET #get_turns' do
    it 'returns http success' do
      request.cookies[JWTSessions.access_cookie] = @tokens[:access]
      params = { id: turn.id }
      get :shifts_available, params: params, format: :json
      expect(response).to have_http_status(:success)
    end
    it 'unauth without cookie' do
      get :shifts_available
      expect(response).to have_http_status(401)
    end
  end
end
