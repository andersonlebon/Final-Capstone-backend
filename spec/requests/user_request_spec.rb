require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  describe 'POST /users' do
    it 'creates a new user' do
      expect do
        post '/api/v1/users', params: {
          user: {
            name: 'Tester_2'
          }
        }
      end.to change { User.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
    end
  end
end
