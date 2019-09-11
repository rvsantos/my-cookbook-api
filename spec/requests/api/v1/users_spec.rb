require 'rails_helper'

describe 'Users API', type: :request do
  let!(:user) { create(:user) }
  let(:user_id) { user.id }
  let(:headers) do
    {
      Accept: 'application/vnd.my-cookbook.v1'
    }
  end

  before { host! 'api.my-cookbook.test' }

  describe 'GET /users/:id' do
    before do
      get "/users/#{user_id}", params: {}, headers: headers
    end

    context 'when the user exists' do
      it 'returns the user' do
        expect(json_body[:id]).to eq(user_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the user does not exist' do
      let(:user_id) { 1000 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end
