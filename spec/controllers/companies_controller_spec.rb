require 'rails_helper'

RSpec.describe Api::V1::CompaniesController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  before do
    payload = { user_id: user.id }
    session = JWTSessions::Session.new(payload: payload)
    @tokens = session.login
  end

  let(:company) { FactoryBot.create(:company) }

  describe 'GET #index' do
    it 'returns http success' do
      request.cookies[JWTSessions.access_cookie] = @tokens[:access]
      get :index, format: :json
      expect(response).to have_http_status(:success)
    end
  end
end
