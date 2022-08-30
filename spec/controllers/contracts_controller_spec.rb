require 'rails_helper'

RSpec.describe Api::V1::ContractsController, type: :controller do

  let(:user) { FactoryBot.create(:user) }

  before do
    payload = { user_id: user.id }
    session = JWTSessions::Session.new(payload: payload)
    @tokens = session.login
  end

  let(:company) { FactoryBot.create(:company) }
  let(:contract) { FactoryBot.create(:contract, company: company) }

  describe 'GET #index' do
    it 'returns http success' do
      request.cookies[JWTSessions.access_cookie] = @tokens[:access]
      get :index, format: :json
      expect(response).to have_http_status(:success)
    end
    it 'unauth without cookie' do
      get :index
      expect(response).to have_http_status(401)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      request.cookies[JWTSessions.access_cookie] = @tokens[:access]
      params = { id: contract.id }
      get :show, params: params, format: :json
      expect(response).to have_http_status(:success)
    end
  end
end
